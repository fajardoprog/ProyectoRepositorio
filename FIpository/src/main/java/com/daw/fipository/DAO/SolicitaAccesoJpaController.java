/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.SolicitaAcceso;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class SolicitaAccesoJpaController implements Serializable {

    public SolicitaAccesoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(SolicitaAcceso solicitaAcceso) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Repositorio repositorio = solicitaAcceso.getRepositorio();
            if (repositorio != null) {
                repositorio = em.getReference(repositorio.getClass(), repositorio.getRepositorioPK());
                solicitaAcceso.setRepositorio(repositorio);
            }
            em.persist(solicitaAcceso);
            if (repositorio != null) {
                repositorio.getSolicitaAccesoList().add(solicitaAcceso);
                repositorio = em.merge(repositorio);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(SolicitaAcceso solicitaAcceso) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            SolicitaAcceso persistentSolicitaAcceso = em.find(SolicitaAcceso.class, solicitaAcceso.getCodSolicitud());
            Repositorio repositorioOld = persistentSolicitaAcceso.getRepositorio();
            Repositorio repositorioNew = solicitaAcceso.getRepositorio();
            if (repositorioNew != null) {
                repositorioNew = em.getReference(repositorioNew.getClass(), repositorioNew.getRepositorioPK());
                solicitaAcceso.setRepositorio(repositorioNew);
            }
            solicitaAcceso = em.merge(solicitaAcceso);
            if (repositorioOld != null && !repositorioOld.equals(repositorioNew)) {
                repositorioOld.getSolicitaAccesoList().remove(solicitaAcceso);
                repositorioOld = em.merge(repositorioOld);
            }
            if (repositorioNew != null && !repositorioNew.equals(repositorioOld)) {
                repositorioNew.getSolicitaAccesoList().add(solicitaAcceso);
                repositorioNew = em.merge(repositorioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = solicitaAcceso.getCodSolicitud();
                if (findSolicitaAcceso(id) == null) {
                    throw new NonexistentEntityException("The solicitaAcceso with id " + id + " no longer exists.");
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
            SolicitaAcceso solicitaAcceso;
            try {
                solicitaAcceso = em.getReference(SolicitaAcceso.class, id);
                solicitaAcceso.getCodSolicitud();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The solicitaAcceso with id " + id + " no longer exists.", enfe);
            }
            Repositorio repositorio = solicitaAcceso.getRepositorio();
            if (repositorio != null) {
                repositorio.getSolicitaAccesoList().remove(solicitaAcceso);
                repositorio = em.merge(repositorio);
            }
            em.remove(solicitaAcceso);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<SolicitaAcceso> findSolicitaAccesoEntities() {
        return findSolicitaAccesoEntities(true, -1, -1);
    }

    public List<SolicitaAcceso> findSolicitaAccesoEntities(int maxResults, int firstResult) {
        return findSolicitaAccesoEntities(false, maxResults, firstResult);
    }

    private List<SolicitaAcceso> findSolicitaAccesoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(SolicitaAcceso.class));
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

    public SolicitaAcceso findSolicitaAcceso(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(SolicitaAcceso.class, id);
        } finally {
            em.close();
        }
    }

    public int getSolicitaAccesoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<SolicitaAcceso> rt = cq.from(SolicitaAcceso.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
