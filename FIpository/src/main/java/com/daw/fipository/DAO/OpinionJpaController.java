/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.IllegalOrphanException;
import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import com.daw.fipository.DTO.Opinion;
import com.daw.fipository.DTO.OpinionPK;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Usuario;
import com.daw.fipository.DTO.Repositorio;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class OpinionJpaController implements Serializable {

    public OpinionJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Opinion opinion) throws IllegalOrphanException, PreexistingEntityException, Exception {
        if (opinion.getOpinionPK() == null) {
            opinion.setOpinionPK(new OpinionPK());
        }
        opinion.getOpinionPK().setNombreUsuarioOpinado(opinion.getRepositorio().getRepositorioPK().getNombreUsuario());
        opinion.getOpinionPK().setNombreRepositorio(opinion.getRepositorio().getRepositorioPK().getNombreRepositorio());
        List<String> illegalOrphanMessages = null;
        Repositorio repositorioOrphanCheck = opinion.getRepositorio();
        if (repositorioOrphanCheck != null) {
            Opinion oldOpinionOfRepositorio = repositorioOrphanCheck.getOpinion();
            if (oldOpinionOfRepositorio != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Repositorio " + repositorioOrphanCheck + " already has an item of type Opinion whose repositorio column cannot be null. Please make another selection for the repositorio field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario nombreUsuario = opinion.getNombreUsuario();
            if (nombreUsuario != null) {
                nombreUsuario = em.getReference(nombreUsuario.getClass(), nombreUsuario.getNombreUsuario());
                opinion.setNombreUsuario(nombreUsuario);
            }
            Repositorio repositorio = opinion.getRepositorio();
            if (repositorio != null) {
                repositorio = em.getReference(repositorio.getClass(), repositorio.getRepositorioPK());
                opinion.setRepositorio(repositorio);
            }
            em.persist(opinion);
            if (nombreUsuario != null) {
                nombreUsuario.getOpinionList().add(opinion);
                nombreUsuario = em.merge(nombreUsuario);
            }
            if (repositorio != null) {
                repositorio.setOpinion(opinion);
                repositorio = em.merge(repositorio);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findOpinion(opinion.getOpinionPK()) != null) {
                throw new PreexistingEntityException("Opinion " + opinion + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Opinion opinion) throws IllegalOrphanException, NonexistentEntityException, Exception {
        opinion.getOpinionPK().setNombreUsuarioOpinado(opinion.getRepositorio().getRepositorioPK().getNombreUsuario());
        opinion.getOpinionPK().setNombreRepositorio(opinion.getRepositorio().getRepositorioPK().getNombreRepositorio());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Opinion persistentOpinion = em.find(Opinion.class, opinion.getOpinionPK());
            Usuario nombreUsuarioOld = persistentOpinion.getNombreUsuario();
            Usuario nombreUsuarioNew = opinion.getNombreUsuario();
            Repositorio repositorioOld = persistentOpinion.getRepositorio();
            Repositorio repositorioNew = opinion.getRepositorio();
            List<String> illegalOrphanMessages = null;
            if (repositorioNew != null && !repositorioNew.equals(repositorioOld)) {
                Opinion oldOpinionOfRepositorio = repositorioNew.getOpinion();
                if (oldOpinionOfRepositorio != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Repositorio " + repositorioNew + " already has an item of type Opinion whose repositorio column cannot be null. Please make another selection for the repositorio field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (nombreUsuarioNew != null) {
                nombreUsuarioNew = em.getReference(nombreUsuarioNew.getClass(), nombreUsuarioNew.getNombreUsuario());
                opinion.setNombreUsuario(nombreUsuarioNew);
            }
            if (repositorioNew != null) {
                repositorioNew = em.getReference(repositorioNew.getClass(), repositorioNew.getRepositorioPK());
                opinion.setRepositorio(repositorioNew);
            }
            opinion = em.merge(opinion);
            if (nombreUsuarioOld != null && !nombreUsuarioOld.equals(nombreUsuarioNew)) {
                nombreUsuarioOld.getOpinionList().remove(opinion);
                nombreUsuarioOld = em.merge(nombreUsuarioOld);
            }
            if (nombreUsuarioNew != null && !nombreUsuarioNew.equals(nombreUsuarioOld)) {
                nombreUsuarioNew.getOpinionList().add(opinion);
                nombreUsuarioNew = em.merge(nombreUsuarioNew);
            }
            if (repositorioOld != null && !repositorioOld.equals(repositorioNew)) {
                repositorioOld.setOpinion(null);
                repositorioOld = em.merge(repositorioOld);
            }
            if (repositorioNew != null && !repositorioNew.equals(repositorioOld)) {
                repositorioNew.setOpinion(opinion);
                repositorioNew = em.merge(repositorioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                OpinionPK id = opinion.getOpinionPK();
                if (findOpinion(id) == null) {
                    throw new NonexistentEntityException("The opinion with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(OpinionPK id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Opinion opinion;
            try {
                opinion = em.getReference(Opinion.class, id);
                opinion.getOpinionPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The opinion with id " + id + " no longer exists.", enfe);
            }
            Usuario nombreUsuario = opinion.getNombreUsuario();
            if (nombreUsuario != null) {
                nombreUsuario.getOpinionList().remove(opinion);
                nombreUsuario = em.merge(nombreUsuario);
            }
            Repositorio repositorio = opinion.getRepositorio();
            if (repositorio != null) {
                repositorio.setOpinion(null);
                repositorio = em.merge(repositorio);
            }
            em.remove(opinion);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Opinion> findOpinionEntities() {
        return findOpinionEntities(true, -1, -1);
    }

    public List<Opinion> findOpinionEntities(int maxResults, int firstResult) {
        return findOpinionEntities(false, maxResults, firstResult);
    }

    private List<Opinion> findOpinionEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Opinion.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Opinion findOpinion(OpinionPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Opinion.class, id);
        } finally {
            em.close();
        }
    }

    public int getOpinionCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Opinion> rt = cq.from(Opinion.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
