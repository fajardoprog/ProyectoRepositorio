/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import com.daw.fipository.DTO.Colaborador;
import com.daw.fipository.DTO.ColaboradorPK;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author IsmaelJJL
 */
public class ColaboradorJpaController implements Serializable {

    public ColaboradorJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Colaborador colaboradores) throws PreexistingEntityException, Exception {
        if (colaboradores.getColaboradoresPK() == null) {
            colaboradores.setColaboradoresPK(new ColaboradorPK());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(colaboradores);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findColaboradores(colaboradores.getColaboradoresPK()) != null) {
                throw new PreexistingEntityException("Colaboradores " + colaboradores + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Colaborador colaboradores) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            colaboradores = em.merge(colaboradores);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                ColaboradorPK id = colaboradores.getColaboradoresPK();
                if (findColaboradores(id) == null) {
                    throw new NonexistentEntityException("The colaboradores with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(ColaboradorPK id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Colaborador colaboradores;
            try {
                colaboradores = em.getReference(Colaborador.class, id);
                colaboradores.getColaboradoresPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The colaboradores with id " + id + " no longer exists.", enfe);
            }
            em.remove(colaboradores);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Colaborador> findColaboradoresEntities() {
        return findColaboradoresEntities(true, -1, -1);
    }

    public List<Colaborador> findColaboradoresEntities(int maxResults, int firstResult) {
        return findColaboradoresEntities(false, maxResults, firstResult);
    }

    private List<Colaborador> findColaboradoresEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Colaborador.class));
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

    public Colaborador findColaboradores(ColaboradorPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Colaborador.class, id);
        } finally {
            em.close();
        }
    }

    public int getColaboradoresCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Colaborador> rt = cq.from(Colaborador.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    public List<Colaborador> listaRepositoriosColaboradores(String usuario) {
        EntityManager em = getEntityManager();
        TypedQuery tq = em.createNamedQuery("Colaborador.findByNombreUsuarioColaborador", Colaborador.class);
        tq.setParameter("nombreUsuarioColaborador", usuario);
        List l = tq.getResultList();
        return l;
    }
}
