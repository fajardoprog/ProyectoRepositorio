/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.Accionsobrearchivo;
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
public class AccionsobrearchivoJpaController implements Serializable {

    public AccionsobrearchivoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Accionsobrearchivo accionsobrearchivo) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(accionsobrearchivo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Accionsobrearchivo accionsobrearchivo) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            accionsobrearchivo = em.merge(accionsobrearchivo);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionsobrearchivo.getCodigoAccion();
                if (findAccionsobrearchivo(id) == null) {
                    throw new NonexistentEntityException("The accionsobrearchivo with id " + id + " no longer exists.");
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
            Accionsobrearchivo accionsobrearchivo;
            try {
                accionsobrearchivo = em.getReference(Accionsobrearchivo.class, id);
                accionsobrearchivo.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionsobrearchivo with id " + id + " no longer exists.", enfe);
            }
            em.remove(accionsobrearchivo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Accionsobrearchivo> findAccionsobrearchivoEntities() {
        return findAccionsobrearchivoEntities(true, -1, -1);
    }

    public List<Accionsobrearchivo> findAccionsobrearchivoEntities(int maxResults, int firstResult) {
        return findAccionsobrearchivoEntities(false, maxResults, firstResult);
    }

    private List<Accionsobrearchivo> findAccionsobrearchivoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Accionsobrearchivo.class));
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

    public Accionsobrearchivo findAccionsobrearchivo(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Accionsobrearchivo.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionsobrearchivoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Accionsobrearchivo> rt = cq.from(Accionsobrearchivo.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
