/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.RepositorioPK;
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
 * @author José Antonio Fajardo Naranjo
 */
public class RepositorioJpaController implements Serializable {

    public RepositorioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Repositorio repositorio) throws PreexistingEntityException, Exception {
        if (repositorio.getRepositorioPK() == null) {
            repositorio.setRepositorioPK(new RepositorioPK());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(repositorio);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findRepositorio(repositorio.getRepositorioPK()) != null) {
                throw new PreexistingEntityException("Repositorio " + repositorio + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Repositorio repositorio) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            repositorio = em.merge(repositorio);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                RepositorioPK id = repositorio.getRepositorioPK();
                if (findRepositorio(id) == null) {
                    throw new NonexistentEntityException("The repositorio with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(RepositorioPK id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Repositorio repositorio;
            try {
                repositorio = em.getReference(Repositorio.class, id);
                repositorio.getRepositorioPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The repositorio with id " + id + " no longer exists.", enfe);
            }
            em.remove(repositorio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Repositorio> findRepositorioEntities() {
        return findRepositorioEntities(true, -1, -1);
    }

    public List<Repositorio> findRepositorioEntities(int maxResults, int firstResult) {
        return findRepositorioEntities(false, maxResults, firstResult);
    }

    private List<Repositorio> findRepositorioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Repositorio.class));
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

    public Repositorio findRepositorio(RepositorioPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Repositorio.class, id);
        } finally {
            em.close();
        }
    }

    public int getRepositorioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Repositorio> rt = cq.from(Repositorio.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
