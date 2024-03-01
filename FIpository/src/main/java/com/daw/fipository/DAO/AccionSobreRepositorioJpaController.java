/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.AccionSobreRepositorio;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Repositorio;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class AccionSobreRepositorioJpaController implements Serializable {

    public AccionSobreRepositorioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AccionSobreRepositorio accionSobreRepositorio) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Repositorio repositorio = accionSobreRepositorio.getRepositorio();
            if (repositorio != null) {
                repositorio = em.getReference(repositorio.getClass(), repositorio.getRepositorioPK());
                accionSobreRepositorio.setRepositorio(repositorio);
            }
            em.persist(accionSobreRepositorio);
            if (repositorio != null) {
                repositorio.getAccionSobreRepositorioList().add(accionSobreRepositorio);
                repositorio = em.merge(repositorio);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AccionSobreRepositorio accionSobreRepositorio) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            AccionSobreRepositorio persistentAccionSobreRepositorio = em.find(AccionSobreRepositorio.class, accionSobreRepositorio.getCodigoAccion());
            Repositorio repositorioOld = persistentAccionSobreRepositorio.getRepositorio();
            Repositorio repositorioNew = accionSobreRepositorio.getRepositorio();
            if (repositorioNew != null) {
                repositorioNew = em.getReference(repositorioNew.getClass(), repositorioNew.getRepositorioPK());
                accionSobreRepositorio.setRepositorio(repositorioNew);
            }
            accionSobreRepositorio = em.merge(accionSobreRepositorio);
            if (repositorioOld != null && !repositorioOld.equals(repositorioNew)) {
                repositorioOld.getAccionSobreRepositorioList().remove(accionSobreRepositorio);
                repositorioOld = em.merge(repositorioOld);
            }
            if (repositorioNew != null && !repositorioNew.equals(repositorioOld)) {
                repositorioNew.getAccionSobreRepositorioList().add(accionSobreRepositorio);
                repositorioNew = em.merge(repositorioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionSobreRepositorio.getCodigoAccion();
                if (findAccionSobreRepositorio(id) == null) {
                    throw new NonexistentEntityException("The accionSobreRepositorio with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            AccionSobreRepositorio accionSobreRepositorio;
            try {
                accionSobreRepositorio = em.getReference(AccionSobreRepositorio.class, id);
                accionSobreRepositorio.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionSobreRepositorio with id " + id + " no longer exists.", enfe);
            }
            Repositorio repositorio = accionSobreRepositorio.getRepositorio();
            if (repositorio != null) {
                repositorio.getAccionSobreRepositorioList().remove(accionSobreRepositorio);
                repositorio = em.merge(repositorio);
            }
            em.remove(accionSobreRepositorio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AccionSobreRepositorio> findAccionSobreRepositorioEntities() {
        return findAccionSobreRepositorioEntities(true, -1, -1);
    }

    public List<AccionSobreRepositorio> findAccionSobreRepositorioEntities(int maxResults, int firstResult) {
        return findAccionSobreRepositorioEntities(false, maxResults, firstResult);
    }

    private List<AccionSobreRepositorio> findAccionSobreRepositorioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AccionSobreRepositorio.class));
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

    public AccionSobreRepositorio findAccionSobreRepositorio(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AccionSobreRepositorio.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionSobreRepositorioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AccionSobreRepositorio> rt = cq.from(AccionSobreRepositorio.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
