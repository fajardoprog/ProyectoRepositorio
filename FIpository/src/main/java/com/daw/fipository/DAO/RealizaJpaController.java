/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import com.daw.fipository.DTO.Realiza;
import com.daw.fipository.DTO.RealizaPK;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class RealizaJpaController implements Serializable {

    public RealizaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Realiza realiza) throws PreexistingEntityException, Exception {
        if (realiza.getRealizaPK() == null) {
            realiza.setRealizaPK(new RealizaPK());
        }
        realiza.getRealizaPK().setNombreUsuario(realiza.getUsuario().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = realiza.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getNombreUsuario());
                realiza.setUsuario(usuario);
            }
            em.persist(realiza);
            if (usuario != null) {
                usuario.getRealizaList().add(realiza);
                usuario = em.merge(usuario);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findRealiza(realiza.getRealizaPK()) != null) {
                throw new PreexistingEntityException("Realiza " + realiza + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Realiza realiza) throws NonexistentEntityException, Exception {
        realiza.getRealizaPK().setNombreUsuario(realiza.getUsuario().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Realiza persistentRealiza = em.find(Realiza.class, realiza.getRealizaPK());
            Usuario usuarioOld = persistentRealiza.getUsuario();
            Usuario usuarioNew = realiza.getUsuario();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getNombreUsuario());
                realiza.setUsuario(usuarioNew);
            }
            realiza = em.merge(realiza);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getRealizaList().remove(realiza);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getRealizaList().add(realiza);
                usuarioNew = em.merge(usuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                RealizaPK id = realiza.getRealizaPK();
                if (findRealiza(id) == null) {
                    throw new NonexistentEntityException("The realiza with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(RealizaPK id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Realiza realiza;
            try {
                realiza = em.getReference(Realiza.class, id);
                realiza.getRealizaPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The realiza with id " + id + " no longer exists.", enfe);
            }
            Usuario usuario = realiza.getUsuario();
            if (usuario != null) {
                usuario.getRealizaList().remove(realiza);
                usuario = em.merge(usuario);
            }
            em.remove(realiza);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Realiza> findRealizaEntities() {
        return findRealizaEntities(true, -1, -1);
    }

    public List<Realiza> findRealizaEntities(int maxResults, int firstResult) {
        return findRealizaEntities(false, maxResults, firstResult);
    }

    private List<Realiza> findRealizaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Realiza.class));
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

    public Realiza findRealiza(RealizaPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Realiza.class, id);
        } finally {
            em.close();
        }
    }

    public int getRealizaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Realiza> rt = cq.from(Realiza.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
