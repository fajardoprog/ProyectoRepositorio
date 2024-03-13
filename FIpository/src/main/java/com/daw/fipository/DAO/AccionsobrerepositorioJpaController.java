/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.Accionsobrerepositorio;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author IsmaelJJL
 */
public class AccionsobrerepositorioJpaController implements Serializable {

    public AccionsobrerepositorioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Accionsobrerepositorio accionsobrerepositorio) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(accionsobrerepositorio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Accionsobrerepositorio accionsobrerepositorio) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            accionsobrerepositorio = em.merge(accionsobrerepositorio);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionsobrerepositorio.getCodigoAccion();
                if (findAccionsobrerepositorio(id) == null) {
                    throw new NonexistentEntityException("The accionsobrerepositorio with id " + id + " no longer exists.");
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
            Accionsobrerepositorio accionsobrerepositorio;
            try {
                accionsobrerepositorio = em.getReference(Accionsobrerepositorio.class, id);
                accionsobrerepositorio.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionsobrerepositorio with id " + id + " no longer exists.", enfe);
            }
            em.remove(accionsobrerepositorio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Accionsobrerepositorio> findAccionsobrerepositorioEntities() {
        return findAccionsobrerepositorioEntities(true, -1, -1);
    }

    public List<Accionsobrerepositorio> findAccionsobrerepositorioEntities(int maxResults, int firstResult) {
        return findAccionsobrerepositorioEntities(false, maxResults, firstResult);
    }

    private List<Accionsobrerepositorio> findAccionsobrerepositorioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Accionsobrerepositorio.class));
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

    public Accionsobrerepositorio findAccionsobrerepositorio(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Accionsobrerepositorio.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionsobrerepositorioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Accionsobrerepositorio> rt = cq.from(Accionsobrerepositorio.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
