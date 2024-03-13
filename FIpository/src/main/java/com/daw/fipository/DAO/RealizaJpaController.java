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
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(realiza);
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
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            realiza = em.merge(realiza);
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
