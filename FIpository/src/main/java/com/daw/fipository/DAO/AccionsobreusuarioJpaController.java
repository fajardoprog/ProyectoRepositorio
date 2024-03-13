/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.Accionsobreusuario;
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
public class AccionsobreusuarioJpaController implements Serializable {

    public AccionsobreusuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Accionsobreusuario accionsobreusuario) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(accionsobreusuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Accionsobreusuario accionsobreusuario) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            accionsobreusuario = em.merge(accionsobreusuario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionsobreusuario.getCodigoAccion();
                if (findAccionsobreusuario(id) == null) {
                    throw new NonexistentEntityException("The accionsobreusuario with id " + id + " no longer exists.");
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
            Accionsobreusuario accionsobreusuario;
            try {
                accionsobreusuario = em.getReference(Accionsobreusuario.class, id);
                accionsobreusuario.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionsobreusuario with id " + id + " no longer exists.", enfe);
            }
            em.remove(accionsobreusuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Accionsobreusuario> findAccionsobreusuarioEntities() {
        return findAccionsobreusuarioEntities(true, -1, -1);
    }

    public List<Accionsobreusuario> findAccionsobreusuarioEntities(int maxResults, int firstResult) {
        return findAccionsobreusuarioEntities(false, maxResults, firstResult);
    }

    private List<Accionsobreusuario> findAccionsobreusuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Accionsobreusuario.class));
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

    public Accionsobreusuario findAccionsobreusuario(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Accionsobreusuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionsobreusuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Accionsobreusuario> rt = cq.from(Accionsobreusuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
