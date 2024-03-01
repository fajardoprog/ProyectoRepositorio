/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.AccionSobreArchivo;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Archivo;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class AccionSobreArchivoJpaController implements Serializable {

    public AccionSobreArchivoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AccionSobreArchivo accionSobreArchivo) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Archivo archivo = accionSobreArchivo.getArchivo();
            if (archivo != null) {
                archivo = em.getReference(archivo.getClass(), archivo.getArchivoPK());
                accionSobreArchivo.setArchivo(archivo);
            }
            em.persist(accionSobreArchivo);
            if (archivo != null) {
                archivo.getAccionSobreArchivoList().add(accionSobreArchivo);
                archivo = em.merge(archivo);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AccionSobreArchivo accionSobreArchivo) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            AccionSobreArchivo persistentAccionSobreArchivo = em.find(AccionSobreArchivo.class, accionSobreArchivo.getCodigoAccion());
            Archivo archivoOld = persistentAccionSobreArchivo.getArchivo();
            Archivo archivoNew = accionSobreArchivo.getArchivo();
            if (archivoNew != null) {
                archivoNew = em.getReference(archivoNew.getClass(), archivoNew.getArchivoPK());
                accionSobreArchivo.setArchivo(archivoNew);
            }
            accionSobreArchivo = em.merge(accionSobreArchivo);
            if (archivoOld != null && !archivoOld.equals(archivoNew)) {
                archivoOld.getAccionSobreArchivoList().remove(accionSobreArchivo);
                archivoOld = em.merge(archivoOld);
            }
            if (archivoNew != null && !archivoNew.equals(archivoOld)) {
                archivoNew.getAccionSobreArchivoList().add(accionSobreArchivo);
                archivoNew = em.merge(archivoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accionSobreArchivo.getCodigoAccion();
                if (findAccionSobreArchivo(id) == null) {
                    throw new NonexistentEntityException("The accionSobreArchivo with id " + id + " no longer exists.");
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
            AccionSobreArchivo accionSobreArchivo;
            try {
                accionSobreArchivo = em.getReference(AccionSobreArchivo.class, id);
                accionSobreArchivo.getCodigoAccion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accionSobreArchivo with id " + id + " no longer exists.", enfe);
            }
            Archivo archivo = accionSobreArchivo.getArchivo();
            if (archivo != null) {
                archivo.getAccionSobreArchivoList().remove(accionSobreArchivo);
                archivo = em.merge(archivo);
            }
            em.remove(accionSobreArchivo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AccionSobreArchivo> findAccionSobreArchivoEntities() {
        return findAccionSobreArchivoEntities(true, -1, -1);
    }

    public List<AccionSobreArchivo> findAccionSobreArchivoEntities(int maxResults, int firstResult) {
        return findAccionSobreArchivoEntities(false, maxResults, firstResult);
    }

    private List<AccionSobreArchivo> findAccionSobreArchivoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AccionSobreArchivo.class));
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

    public AccionSobreArchivo findAccionSobreArchivo(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AccionSobreArchivo.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccionSobreArchivoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AccionSobreArchivo> rt = cq.from(AccionSobreArchivo.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
