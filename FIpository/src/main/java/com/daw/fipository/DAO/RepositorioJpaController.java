/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DAO;

import com.daw.fipository.DAO.exceptions.IllegalOrphanException;
import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DAO.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.daw.fipository.DTO.Usuario;
import com.daw.fipository.DTO.Opinion;
import java.util.ArrayList;
import java.util.List;
import com.daw.fipository.DTO.Archivo;
import com.daw.fipository.DTO.SolicitaAcceso;
import com.daw.fipository.DTO.AccionSobreRepositorio;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.RepositorioPK;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

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
        if (repositorio.getUsuarioList() == null) {
            repositorio.setUsuarioList(new ArrayList<Usuario>());
        }
        if (repositorio.getArchivoList() == null) {
            repositorio.setArchivoList(new ArrayList<Archivo>());
        }
        if (repositorio.getSolicitaAccesoList() == null) {
            repositorio.setSolicitaAccesoList(new ArrayList<SolicitaAcceso>());
        }
        if (repositorio.getAccionSobreRepositorioList() == null) {
            repositorio.setAccionSobreRepositorioList(new ArrayList<AccionSobreRepositorio>());
        }
        repositorio.getRepositorioPK().setNombreUsuario(repositorio.getUsuario().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = repositorio.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getNombreUsuario());
                repositorio.setUsuario(usuario);
            }
            Opinion opinion = repositorio.getOpinion();
            if (opinion != null) {
                opinion = em.getReference(opinion.getClass(), opinion.getOpinionPK());
                repositorio.setOpinion(opinion);
            }
            List<Usuario> attachedUsuarioList = new ArrayList<Usuario>();
            for (Usuario usuarioListUsuarioToAttach : repositorio.getUsuarioList()) {
                usuarioListUsuarioToAttach = em.getReference(usuarioListUsuarioToAttach.getClass(), usuarioListUsuarioToAttach.getNombreUsuario());
                attachedUsuarioList.add(usuarioListUsuarioToAttach);
            }
            repositorio.setUsuarioList(attachedUsuarioList);
            List<Archivo> attachedArchivoList = new ArrayList<Archivo>();
            for (Archivo archivoListArchivoToAttach : repositorio.getArchivoList()) {
                archivoListArchivoToAttach = em.getReference(archivoListArchivoToAttach.getClass(), archivoListArchivoToAttach.getArchivoPK());
                attachedArchivoList.add(archivoListArchivoToAttach);
            }
            repositorio.setArchivoList(attachedArchivoList);
            List<SolicitaAcceso> attachedSolicitaAccesoList = new ArrayList<SolicitaAcceso>();
            for (SolicitaAcceso solicitaAccesoListSolicitaAccesoToAttach : repositorio.getSolicitaAccesoList()) {
                solicitaAccesoListSolicitaAccesoToAttach = em.getReference(solicitaAccesoListSolicitaAccesoToAttach.getClass(), solicitaAccesoListSolicitaAccesoToAttach.getCodSolicitud());
                attachedSolicitaAccesoList.add(solicitaAccesoListSolicitaAccesoToAttach);
            }
            repositorio.setSolicitaAccesoList(attachedSolicitaAccesoList);
            List<AccionSobreRepositorio> attachedAccionSobreRepositorioList = new ArrayList<AccionSobreRepositorio>();
            for (AccionSobreRepositorio accionSobreRepositorioListAccionSobreRepositorioToAttach : repositorio.getAccionSobreRepositorioList()) {
                accionSobreRepositorioListAccionSobreRepositorioToAttach = em.getReference(accionSobreRepositorioListAccionSobreRepositorioToAttach.getClass(), accionSobreRepositorioListAccionSobreRepositorioToAttach.getCodigoAccion());
                attachedAccionSobreRepositorioList.add(accionSobreRepositorioListAccionSobreRepositorioToAttach);
            }
            repositorio.setAccionSobreRepositorioList(attachedAccionSobreRepositorioList);
            em.persist(repositorio);
            if (usuario != null) {
                usuario.getRepositorioList().add(repositorio);
                usuario = em.merge(usuario);
            }
            if (opinion != null) {
                Repositorio oldRepositorioOfOpinion = opinion.getRepositorio();
                if (oldRepositorioOfOpinion != null) {
                    oldRepositorioOfOpinion.setOpinion(null);
                    oldRepositorioOfOpinion = em.merge(oldRepositorioOfOpinion);
                }
                opinion.setRepositorio(repositorio);
                opinion = em.merge(opinion);
            }
            for (Usuario usuarioListUsuario : repositorio.getUsuarioList()) {
                usuarioListUsuario.getRepositorioList().add(repositorio);
                usuarioListUsuario = em.merge(usuarioListUsuario);
            }
            for (Archivo archivoListArchivo : repositorio.getArchivoList()) {
                Repositorio oldRepositorioOfArchivoListArchivo = archivoListArchivo.getRepositorio();
                archivoListArchivo.setRepositorio(repositorio);
                archivoListArchivo = em.merge(archivoListArchivo);
                if (oldRepositorioOfArchivoListArchivo != null) {
                    oldRepositorioOfArchivoListArchivo.getArchivoList().remove(archivoListArchivo);
                    oldRepositorioOfArchivoListArchivo = em.merge(oldRepositorioOfArchivoListArchivo);
                }
            }
            for (SolicitaAcceso solicitaAccesoListSolicitaAcceso : repositorio.getSolicitaAccesoList()) {
                Repositorio oldRepositorioOfSolicitaAccesoListSolicitaAcceso = solicitaAccesoListSolicitaAcceso.getRepositorio();
                solicitaAccesoListSolicitaAcceso.setRepositorio(repositorio);
                solicitaAccesoListSolicitaAcceso = em.merge(solicitaAccesoListSolicitaAcceso);
                if (oldRepositorioOfSolicitaAccesoListSolicitaAcceso != null) {
                    oldRepositorioOfSolicitaAccesoListSolicitaAcceso.getSolicitaAccesoList().remove(solicitaAccesoListSolicitaAcceso);
                    oldRepositorioOfSolicitaAccesoListSolicitaAcceso = em.merge(oldRepositorioOfSolicitaAccesoListSolicitaAcceso);
                }
            }
            for (AccionSobreRepositorio accionSobreRepositorioListAccionSobreRepositorio : repositorio.getAccionSobreRepositorioList()) {
                Repositorio oldRepositorioOfAccionSobreRepositorioListAccionSobreRepositorio = accionSobreRepositorioListAccionSobreRepositorio.getRepositorio();
                accionSobreRepositorioListAccionSobreRepositorio.setRepositorio(repositorio);
                accionSobreRepositorioListAccionSobreRepositorio = em.merge(accionSobreRepositorioListAccionSobreRepositorio);
                if (oldRepositorioOfAccionSobreRepositorioListAccionSobreRepositorio != null) {
                    oldRepositorioOfAccionSobreRepositorioListAccionSobreRepositorio.getAccionSobreRepositorioList().remove(accionSobreRepositorioListAccionSobreRepositorio);
                    oldRepositorioOfAccionSobreRepositorioListAccionSobreRepositorio = em.merge(oldRepositorioOfAccionSobreRepositorioListAccionSobreRepositorio);
                }
            }
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

    public void edit(Repositorio repositorio) throws IllegalOrphanException, NonexistentEntityException, Exception {
        repositorio.getRepositorioPK().setNombreUsuario(repositorio.getUsuario().getNombreUsuario());
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Repositorio persistentRepositorio = em.find(Repositorio.class, repositorio.getRepositorioPK());
            Usuario usuarioOld = persistentRepositorio.getUsuario();
            Usuario usuarioNew = repositorio.getUsuario();
            Opinion opinionOld = persistentRepositorio.getOpinion();
            Opinion opinionNew = repositorio.getOpinion();
            List<Usuario> usuarioListOld = persistentRepositorio.getUsuarioList();
            List<Usuario> usuarioListNew = repositorio.getUsuarioList();
            List<Archivo> archivoListOld = persistentRepositorio.getArchivoList();
            List<Archivo> archivoListNew = repositorio.getArchivoList();
            List<SolicitaAcceso> solicitaAccesoListOld = persistentRepositorio.getSolicitaAccesoList();
            List<SolicitaAcceso> solicitaAccesoListNew = repositorio.getSolicitaAccesoList();
            List<AccionSobreRepositorio> accionSobreRepositorioListOld = persistentRepositorio.getAccionSobreRepositorioList();
            List<AccionSobreRepositorio> accionSobreRepositorioListNew = repositorio.getAccionSobreRepositorioList();
            List<String> illegalOrphanMessages = null;
            if (opinionOld != null && !opinionOld.equals(opinionNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Opinion " + opinionOld + " since its repositorio field is not nullable.");
            }
            for (Archivo archivoListOldArchivo : archivoListOld) {
                if (!archivoListNew.contains(archivoListOldArchivo)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Archivo " + archivoListOldArchivo + " since its repositorio field is not nullable.");
                }
            }
            for (SolicitaAcceso solicitaAccesoListOldSolicitaAcceso : solicitaAccesoListOld) {
                if (!solicitaAccesoListNew.contains(solicitaAccesoListOldSolicitaAcceso)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain SolicitaAcceso " + solicitaAccesoListOldSolicitaAcceso + " since its repositorio field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getNombreUsuario());
                repositorio.setUsuario(usuarioNew);
            }
            if (opinionNew != null) {
                opinionNew = em.getReference(opinionNew.getClass(), opinionNew.getOpinionPK());
                repositorio.setOpinion(opinionNew);
            }
            List<Usuario> attachedUsuarioListNew = new ArrayList<Usuario>();
            for (Usuario usuarioListNewUsuarioToAttach : usuarioListNew) {
                usuarioListNewUsuarioToAttach = em.getReference(usuarioListNewUsuarioToAttach.getClass(), usuarioListNewUsuarioToAttach.getNombreUsuario());
                attachedUsuarioListNew.add(usuarioListNewUsuarioToAttach);
            }
            usuarioListNew = attachedUsuarioListNew;
            repositorio.setUsuarioList(usuarioListNew);
            List<Archivo> attachedArchivoListNew = new ArrayList<Archivo>();
            for (Archivo archivoListNewArchivoToAttach : archivoListNew) {
                archivoListNewArchivoToAttach = em.getReference(archivoListNewArchivoToAttach.getClass(), archivoListNewArchivoToAttach.getArchivoPK());
                attachedArchivoListNew.add(archivoListNewArchivoToAttach);
            }
            archivoListNew = attachedArchivoListNew;
            repositorio.setArchivoList(archivoListNew);
            List<SolicitaAcceso> attachedSolicitaAccesoListNew = new ArrayList<SolicitaAcceso>();
            for (SolicitaAcceso solicitaAccesoListNewSolicitaAccesoToAttach : solicitaAccesoListNew) {
                solicitaAccesoListNewSolicitaAccesoToAttach = em.getReference(solicitaAccesoListNewSolicitaAccesoToAttach.getClass(), solicitaAccesoListNewSolicitaAccesoToAttach.getCodSolicitud());
                attachedSolicitaAccesoListNew.add(solicitaAccesoListNewSolicitaAccesoToAttach);
            }
            solicitaAccesoListNew = attachedSolicitaAccesoListNew;
            repositorio.setSolicitaAccesoList(solicitaAccesoListNew);
            List<AccionSobreRepositorio> attachedAccionSobreRepositorioListNew = new ArrayList<AccionSobreRepositorio>();
            for (AccionSobreRepositorio accionSobreRepositorioListNewAccionSobreRepositorioToAttach : accionSobreRepositorioListNew) {
                accionSobreRepositorioListNewAccionSobreRepositorioToAttach = em.getReference(accionSobreRepositorioListNewAccionSobreRepositorioToAttach.getClass(), accionSobreRepositorioListNewAccionSobreRepositorioToAttach.getCodigoAccion());
                attachedAccionSobreRepositorioListNew.add(accionSobreRepositorioListNewAccionSobreRepositorioToAttach);
            }
            accionSobreRepositorioListNew = attachedAccionSobreRepositorioListNew;
            repositorio.setAccionSobreRepositorioList(accionSobreRepositorioListNew);
            repositorio = em.merge(repositorio);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getRepositorioList().remove(repositorio);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getRepositorioList().add(repositorio);
                usuarioNew = em.merge(usuarioNew);
            }
            if (opinionNew != null && !opinionNew.equals(opinionOld)) {
                Repositorio oldRepositorioOfOpinion = opinionNew.getRepositorio();
                if (oldRepositorioOfOpinion != null) {
                    oldRepositorioOfOpinion.setOpinion(null);
                    oldRepositorioOfOpinion = em.merge(oldRepositorioOfOpinion);
                }
                opinionNew.setRepositorio(repositorio);
                opinionNew = em.merge(opinionNew);
            }
            for (Usuario usuarioListOldUsuario : usuarioListOld) {
                if (!usuarioListNew.contains(usuarioListOldUsuario)) {
                    usuarioListOldUsuario.getRepositorioList().remove(repositorio);
                    usuarioListOldUsuario = em.merge(usuarioListOldUsuario);
                }
            }
            for (Usuario usuarioListNewUsuario : usuarioListNew) {
                if (!usuarioListOld.contains(usuarioListNewUsuario)) {
                    usuarioListNewUsuario.getRepositorioList().add(repositorio);
                    usuarioListNewUsuario = em.merge(usuarioListNewUsuario);
                }
            }
            for (Archivo archivoListNewArchivo : archivoListNew) {
                if (!archivoListOld.contains(archivoListNewArchivo)) {
                    Repositorio oldRepositorioOfArchivoListNewArchivo = archivoListNewArchivo.getRepositorio();
                    archivoListNewArchivo.setRepositorio(repositorio);
                    archivoListNewArchivo = em.merge(archivoListNewArchivo);
                    if (oldRepositorioOfArchivoListNewArchivo != null && !oldRepositorioOfArchivoListNewArchivo.equals(repositorio)) {
                        oldRepositorioOfArchivoListNewArchivo.getArchivoList().remove(archivoListNewArchivo);
                        oldRepositorioOfArchivoListNewArchivo = em.merge(oldRepositorioOfArchivoListNewArchivo);
                    }
                }
            }
            for (SolicitaAcceso solicitaAccesoListNewSolicitaAcceso : solicitaAccesoListNew) {
                if (!solicitaAccesoListOld.contains(solicitaAccesoListNewSolicitaAcceso)) {
                    Repositorio oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso = solicitaAccesoListNewSolicitaAcceso.getRepositorio();
                    solicitaAccesoListNewSolicitaAcceso.setRepositorio(repositorio);
                    solicitaAccesoListNewSolicitaAcceso = em.merge(solicitaAccesoListNewSolicitaAcceso);
                    if (oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso != null && !oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso.equals(repositorio)) {
                        oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso.getSolicitaAccesoList().remove(solicitaAccesoListNewSolicitaAcceso);
                        oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso = em.merge(oldRepositorioOfSolicitaAccesoListNewSolicitaAcceso);
                    }
                }
            }
            for (AccionSobreRepositorio accionSobreRepositorioListOldAccionSobreRepositorio : accionSobreRepositorioListOld) {
                if (!accionSobreRepositorioListNew.contains(accionSobreRepositorioListOldAccionSobreRepositorio)) {
                    accionSobreRepositorioListOldAccionSobreRepositorio.setRepositorio(null);
                    accionSobreRepositorioListOldAccionSobreRepositorio = em.merge(accionSobreRepositorioListOldAccionSobreRepositorio);
                }
            }
            for (AccionSobreRepositorio accionSobreRepositorioListNewAccionSobreRepositorio : accionSobreRepositorioListNew) {
                if (!accionSobreRepositorioListOld.contains(accionSobreRepositorioListNewAccionSobreRepositorio)) {
                    Repositorio oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio = accionSobreRepositorioListNewAccionSobreRepositorio.getRepositorio();
                    accionSobreRepositorioListNewAccionSobreRepositorio.setRepositorio(repositorio);
                    accionSobreRepositorioListNewAccionSobreRepositorio = em.merge(accionSobreRepositorioListNewAccionSobreRepositorio);
                    if (oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio != null && !oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio.equals(repositorio)) {
                        oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio.getAccionSobreRepositorioList().remove(accionSobreRepositorioListNewAccionSobreRepositorio);
                        oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio = em.merge(oldRepositorioOfAccionSobreRepositorioListNewAccionSobreRepositorio);
                    }
                }
            }
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

    public void destroy(RepositorioPK id) throws IllegalOrphanException, NonexistentEntityException {
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
            List<String> illegalOrphanMessages = null;
            Opinion opinionOrphanCheck = repositorio.getOpinion();
            if (opinionOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Repositorio (" + repositorio + ") cannot be destroyed since the Opinion " + opinionOrphanCheck + " in its opinion field has a non-nullable repositorio field.");
            }
            List<Archivo> archivoListOrphanCheck = repositorio.getArchivoList();
            for (Archivo archivoListOrphanCheckArchivo : archivoListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Repositorio (" + repositorio + ") cannot be destroyed since the Archivo " + archivoListOrphanCheckArchivo + " in its archivoList field has a non-nullable repositorio field.");
            }
            List<SolicitaAcceso> solicitaAccesoListOrphanCheck = repositorio.getSolicitaAccesoList();
            for (SolicitaAcceso solicitaAccesoListOrphanCheckSolicitaAcceso : solicitaAccesoListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Repositorio (" + repositorio + ") cannot be destroyed since the SolicitaAcceso " + solicitaAccesoListOrphanCheckSolicitaAcceso + " in its solicitaAccesoList field has a non-nullable repositorio field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Usuario usuario = repositorio.getUsuario();
            if (usuario != null) {
                usuario.getRepositorioList().remove(repositorio);
                usuario = em.merge(usuario);
            }
            List<Usuario> usuarioList = repositorio.getUsuarioList();
            for (Usuario usuarioListUsuario : usuarioList) {
                usuarioListUsuario.getRepositorioList().remove(repositorio);
                usuarioListUsuario = em.merge(usuarioListUsuario);
            }
            List<AccionSobreRepositorio> accionSobreRepositorioList = repositorio.getAccionSobreRepositorioList();
            for (AccionSobreRepositorio accionSobreRepositorioListAccionSobreRepositorio : accionSobreRepositorioList) {
                accionSobreRepositorioListAccionSobreRepositorio.setRepositorio(null);
                accionSobreRepositorioListAccionSobreRepositorio = em.merge(accionSobreRepositorioListAccionSobreRepositorio);
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
