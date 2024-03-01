/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.AccionSobreArchivo;
import com.daw.fipository.DTO.Archivo;
import com.daw.fipository.DTO.ArchivoPK;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class ArchivoJpaController implements Serializable {

    public ArchivoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Archivo archivo) throws PreexistingEntityException, Exception {
        if (archivo.getArchivoPK() == null) {
            archivo.setArchivoPK(new ArchivoPK());
        }
        if (archivo.getAccionSobreArchivoList() == null) {
            archivo.setAccionSobreArchivoList(new ArrayList<AccionSobreArchivo>());
        }
        archivo.getArchivoPK().setNombreRepositorio(archivo.getRepositorio().getRepositorioPK().getNombreRepositorio());
        archivo.getArchivoPK().setNombreUsuario(archivo.getRepositorio().getRepositorioPK().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Repositorio repositorio = archivo.getRepositorio();
            if (repositorio != null) {
                repositorio = em.getReference(repositorio.getClass(), repositorio.getRepositorioPK());
                archivo.setRepositorio(repositorio);
            }
            List<AccionSobreArchivo> attachedAccionSobreArchivoList = new ArrayList<AccionSobreArchivo>();
            for (AccionSobreArchivo accionSobreArchivoListAccionSobreArchivoToAttach : archivo.getAccionSobreArchivoList()) {
                accionSobreArchivoListAccionSobreArchivoToAttach = em.getReference(accionSobreArchivoListAccionSobreArchivoToAttach.getClass(), accionSobreArchivoListAccionSobreArchivoToAttach.getCodigoAccion());
                attachedAccionSobreArchivoList.add(accionSobreArchivoListAccionSobreArchivoToAttach);
            }
            archivo.setAccionSobreArchivoList(attachedAccionSobreArchivoList);
            em.persist(archivo);
            if (repositorio != null) {
                repositorio.getArchivoList().add(archivo);
                repositorio = em.merge(repositorio);
            }
            for (AccionSobreArchivo accionSobreArchivoListAccionSobreArchivo : archivo.getAccionSobreArchivoList()) {
                Archivo oldArchivoOfAccionSobreArchivoListAccionSobreArchivo = accionSobreArchivoListAccionSobreArchivo.getArchivo();
                accionSobreArchivoListAccionSobreArchivo.setArchivo(archivo);
                accionSobreArchivoListAccionSobreArchivo = em.merge(accionSobreArchivoListAccionSobreArchivo);
                if (oldArchivoOfAccionSobreArchivoListAccionSobreArchivo != null) {
                    oldArchivoOfAccionSobreArchivoListAccionSobreArchivo.getAccionSobreArchivoList().remove(accionSobreArchivoListAccionSobreArchivo);
                    oldArchivoOfAccionSobreArchivoListAccionSobreArchivo = em.merge(oldArchivoOfAccionSobreArchivoListAccionSobreArchivo);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findArchivo(archivo.getArchivoPK()) != null) {
                throw new PreexistingEntityException("Archivo " + archivo + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Archivo archivo) throws NonexistentEntityException, Exception {
        archivo.getArchivoPK().setNombreRepositorio(archivo.getRepositorio().getRepositorioPK().getNombreRepositorio());
        archivo.getArchivoPK().setNombreUsuario(archivo.getRepositorio().getRepositorioPK().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Archivo persistentArchivo = em.find(Archivo.class, archivo.getArchivoPK());
            Repositorio repositorioOld = persistentArchivo.getRepositorio();
            Repositorio repositorioNew = archivo.getRepositorio();
            List<AccionSobreArchivo> accionSobreArchivoListOld = persistentArchivo.getAccionSobreArchivoList();
            List<AccionSobreArchivo> accionSobreArchivoListNew = archivo.getAccionSobreArchivoList();
            if (repositorioNew != null) {
                repositorioNew = em.getReference(repositorioNew.getClass(), repositorioNew.getRepositorioPK());
                archivo.setRepositorio(repositorioNew);
            }
            List<AccionSobreArchivo> attachedAccionSobreArchivoListNew = new ArrayList<AccionSobreArchivo>();
            for (AccionSobreArchivo accionSobreArchivoListNewAccionSobreArchivoToAttach : accionSobreArchivoListNew) {
                accionSobreArchivoListNewAccionSobreArchivoToAttach = em.getReference(accionSobreArchivoListNewAccionSobreArchivoToAttach.getClass(), accionSobreArchivoListNewAccionSobreArchivoToAttach.getCodigoAccion());
                attachedAccionSobreArchivoListNew.add(accionSobreArchivoListNewAccionSobreArchivoToAttach);
            }
            accionSobreArchivoListNew = attachedAccionSobreArchivoListNew;
            archivo.setAccionSobreArchivoList(accionSobreArchivoListNew);
            archivo = em.merge(archivo);
            if (repositorioOld != null && !repositorioOld.equals(repositorioNew)) {
                repositorioOld.getArchivoList().remove(archivo);
                repositorioOld = em.merge(repositorioOld);
            }
            if (repositorioNew != null && !repositorioNew.equals(repositorioOld)) {
                repositorioNew.getArchivoList().add(archivo);
                repositorioNew = em.merge(repositorioNew);
            }
            for (AccionSobreArchivo accionSobreArchivoListOldAccionSobreArchivo : accionSobreArchivoListOld) {
                if (!accionSobreArchivoListNew.contains(accionSobreArchivoListOldAccionSobreArchivo)) {
                    accionSobreArchivoListOldAccionSobreArchivo.setArchivo(null);
                    accionSobreArchivoListOldAccionSobreArchivo = em.merge(accionSobreArchivoListOldAccionSobreArchivo);
                }
            }
            for (AccionSobreArchivo accionSobreArchivoListNewAccionSobreArchivo : accionSobreArchivoListNew) {
                if (!accionSobreArchivoListOld.contains(accionSobreArchivoListNewAccionSobreArchivo)) {
                    Archivo oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo = accionSobreArchivoListNewAccionSobreArchivo.getArchivo();
                    accionSobreArchivoListNewAccionSobreArchivo.setArchivo(archivo);
                    accionSobreArchivoListNewAccionSobreArchivo = em.merge(accionSobreArchivoListNewAccionSobreArchivo);
                    if (oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo != null && !oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo.equals(archivo)) {
                        oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo.getAccionSobreArchivoList().remove(accionSobreArchivoListNewAccionSobreArchivo);
                        oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo = em.merge(oldArchivoOfAccionSobreArchivoListNewAccionSobreArchivo);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                ArchivoPK id = archivo.getArchivoPK();
                if (findArchivo(id) == null) {
                    throw new NonexistentEntityException("The archivo with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(ArchivoPK id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Archivo archivo;
            try {
                archivo = em.getReference(Archivo.class, id);
                archivo.getArchivoPK();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The archivo with id " + id + " no longer exists.", enfe);
            }
            Repositorio repositorio = archivo.getRepositorio();
            if (repositorio != null) {
                repositorio.getArchivoList().remove(archivo);
                repositorio = em.merge(repositorio);
            }
            List<AccionSobreArchivo> accionSobreArchivoList = archivo.getAccionSobreArchivoList();
            for (AccionSobreArchivo accionSobreArchivoListAccionSobreArchivo : accionSobreArchivoList) {
                accionSobreArchivoListAccionSobreArchivo.setArchivo(null);
                accionSobreArchivoListAccionSobreArchivo = em.merge(accionSobreArchivoListAccionSobreArchivo);
            }
            em.remove(archivo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Archivo> findArchivoEntities() {
        return findArchivoEntities(true, -1, -1);
    }

    public List<Archivo> findArchivoEntities(int maxResults, int firstResult) {
        return findArchivoEntities(false, maxResults, firstResult);
    }

    private List<Archivo> findArchivoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Archivo.class));
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

    public Archivo findArchivo(ArchivoPK id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Archivo.class, id);
        } finally {
            em.close();
        }
    }

    public int getArchivoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Archivo> rt = cq.from(Archivo.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
