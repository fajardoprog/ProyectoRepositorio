/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.AccionSobreUsuario;
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
public class AccionSobreUsuarioJpaController implements Serializable {

    public AccionSobreUsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AccionSobreUsuario accionSobreUsuario) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario codigoUsuarioAfectado = accionSobreUsuario.getCodigoUsuarioAfectado();
            if (codigoUsuarioAfectado != null) {
                codigoUsuarioAfectado = em.getReference(codigoUsuarioAfectado.getClass(), codigoUsuarioAfectado.getNombreUsuario());
                accionSobreUsuario.setCodigoUsuarioAfectado(codigoUsuarioAfectado);
            }
            em.persist(accionSobreUsuario);
            if (codigoUsuarioAfectado != null) {
                codigoUsuarioAfectado.getAccionSobreUsuarioList().add(accionSobreUsuario);
                codigoUsuarioAfectado = em.merge(codigoUsuarioAfectado);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AccionSobreUsuario accionSobreUsuario) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            AccionSobreUsuario persistentAccionSobreUsuario = em.find(AccionSobreUsuario.class, accionSobreUsuario.getCodigoAccion());
            Usuario codigoUsuarioAfectadoOld = persistentAccionSobreUsuario.getCodigoUsuarioAfectado();
            Usuario codigoUsuarioAfectadoNew = accionSobreUsuario.getCodigoUsuarioAfectado();
            if (codigoUsuarioAfectadoNew != null) {
                codigoUsuarioAfectadoNew = em.getReference(codigoUsuarioAfectadoNew.getClass(), codigoUsuarioAfectadoNew.getNombreUsuario());
                accionSobreUsuario.setCodigoUsuarioAfectado(codigoUsuarioAfectadoNew);
            }
            accionSobreUsuario = em.merge(accionSobreUsuario);
            if (codigoUsuarioAfectadoOld != null && !codigoUsuarioAfectadoOld.equals(codigoUsuarioAfectadoNew)) {
                codigoUsuarioAfectadoOld.getAccionSobreUsuarioList().remove(accionSobreUsuario);
                codigoUsuarioAfectadoOld = em.merge(codigoUsuarioAfectadoOld);
            }
            if (codigoUsuarioAfectadoNew != null && !codigoUsuarioAfectadoNew.equals(codigoUsuarioAfectadoOld)) {
                codigoUsuarioAfectadoNew.getAccionSobreUsuarioList().add(accionSobreUsuario);
                codigoUsuarioAfectadoNew = em.merge(codigoUsuarioAfectadoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionSobreUsuario.getCodigoAccion();
                if (findAccionSobreUsuario(id) == null) {
                    throw new NonexistentEntityException("The accionSobreUsuario with id " + id + " no longer exists.");
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
            AccionSobreUsuario accionSobreUsuario;
            try {
                accionSobreUsuario = em.getReference(AccionSobreUsuario.class, id);
                accionSobreUsuario.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionSobreUsuario with id " + id + " no longer exists.", enfe);
            }
            Usuario codigoUsuarioAfectado = accionSobreUsuario.getCodigoUsuarioAfectado();
            if (codigoUsuarioAfectado != null) {
                codigoUsuarioAfectado.getAccionSobreUsuarioList().remove(accionSobreUsuario);
                codigoUsuarioAfectado = em.merge(codigoUsuarioAfectado);
            }
            em.remove(accionSobreUsuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AccionSobreUsuario> findAccionSobreUsuarioEntities() {
        return findAccionSobreUsuarioEntities(true, -1, -1);
    }

    public List<AccionSobreUsuario> findAccionSobreUsuarioEntities(int maxResults, int firstResult) {
        return findAccionSobreUsuarioEntities(false, maxResults, firstResult);
    }

    private List<AccionSobreUsuario> findAccionSobreUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AccionSobreUsuario.class));
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

    public AccionSobreUsuario findAccionSobreUsuario(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AccionSobreUsuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionSobreUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AccionSobreUsuario> rt = cq.from(AccionSobreUsuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
