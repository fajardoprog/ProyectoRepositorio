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
import com.daw.fipository.DTO.Repositorio;
import java.util.ArrayList;
import java.util.List;
import com.daw.fipository.DTO.AccionSobreUsuario;
import com.daw.fipository.DTO.Realiza;
import com.daw.fipository.DTO.Opinion;
import com.daw.fipository.DTO.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class UsuarioJpaController implements Serializable {

    public UsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Usuario usuario) throws PreexistingEntityException, Exception {
        if (usuario.getRepositorioList() == null) {
            usuario.setRepositorioList(new ArrayList<Repositorio>());
        }
        if (usuario.getRepositorioList1() == null) {
            usuario.setRepositorioList1(new ArrayList<Repositorio>());
        }
        if (usuario.getAccionSobreUsuarioList() == null) {
            usuario.setAccionSobreUsuarioList(new ArrayList<AccionSobreUsuario>());
        }
        if (usuario.getRealizaList() == null) {
            usuario.setRealizaList(new ArrayList<Realiza>());
        }
        if (usuario.getOpinionList() == null) {
            usuario.setOpinionList(new ArrayList<Opinion>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Repositorio> attachedRepositorioList = new ArrayList<Repositorio>();
            for (Repositorio repositorioListRepositorioToAttach : usuario.getRepositorioList()) {
                repositorioListRepositorioToAttach = em.getReference(repositorioListRepositorioToAttach.getClass(), repositorioListRepositorioToAttach.getRepositorioPK());
                attachedRepositorioList.add(repositorioListRepositorioToAttach);
            }
            usuario.setRepositorioList(attachedRepositorioList);
            List<Repositorio> attachedRepositorioList1 = new ArrayList<Repositorio>();
            for (Repositorio repositorioList1RepositorioToAttach : usuario.getRepositorioList1()) {
                repositorioList1RepositorioToAttach = em.getReference(repositorioList1RepositorioToAttach.getClass(), repositorioList1RepositorioToAttach.getRepositorioPK());
                attachedRepositorioList1.add(repositorioList1RepositorioToAttach);
            }
            usuario.setRepositorioList1(attachedRepositorioList1);
            List<AccionSobreUsuario> attachedAccionSobreUsuarioList = new ArrayList<AccionSobreUsuario>();
            for (AccionSobreUsuario accionSobreUsuarioListAccionSobreUsuarioToAttach : usuario.getAccionSobreUsuarioList()) {
                accionSobreUsuarioListAccionSobreUsuarioToAttach = em.getReference(accionSobreUsuarioListAccionSobreUsuarioToAttach.getClass(), accionSobreUsuarioListAccionSobreUsuarioToAttach.getCodigoAccion());
                attachedAccionSobreUsuarioList.add(accionSobreUsuarioListAccionSobreUsuarioToAttach);
            }
            usuario.setAccionSobreUsuarioList(attachedAccionSobreUsuarioList);
            List<Realiza> attachedRealizaList = new ArrayList<Realiza>();
            for (Realiza realizaListRealizaToAttach : usuario.getRealizaList()) {
                realizaListRealizaToAttach = em.getReference(realizaListRealizaToAttach.getClass(), realizaListRealizaToAttach.getRealizaPK());
                attachedRealizaList.add(realizaListRealizaToAttach);
            }
            usuario.setRealizaList(attachedRealizaList);
            List<Opinion> attachedOpinionList = new ArrayList<Opinion>();
            for (Opinion opinionListOpinionToAttach : usuario.getOpinionList()) {
                opinionListOpinionToAttach = em.getReference(opinionListOpinionToAttach.getClass(), opinionListOpinionToAttach.getOpinionPK());
                attachedOpinionList.add(opinionListOpinionToAttach);
            }
            usuario.setOpinionList(attachedOpinionList);
            em.persist(usuario);
            for (Repositorio repositorioListRepositorio : usuario.getRepositorioList()) {
                repositorioListRepositorio.getUsuarioList().add(usuario);
                repositorioListRepositorio = em.merge(repositorioListRepositorio);
            }
            for (Repositorio repositorioList1Repositorio : usuario.getRepositorioList1()) {
                Usuario oldUsuarioOfRepositorioList1Repositorio = repositorioList1Repositorio.getUsuario();
                repositorioList1Repositorio.setUsuario(usuario);
                repositorioList1Repositorio = em.merge(repositorioList1Repositorio);
                if (oldUsuarioOfRepositorioList1Repositorio != null) {
                    oldUsuarioOfRepositorioList1Repositorio.getRepositorioList1().remove(repositorioList1Repositorio);
                    oldUsuarioOfRepositorioList1Repositorio = em.merge(oldUsuarioOfRepositorioList1Repositorio);
                }
            }
            for (AccionSobreUsuario accionSobreUsuarioListAccionSobreUsuario : usuario.getAccionSobreUsuarioList()) {
                Usuario oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListAccionSobreUsuario = accionSobreUsuarioListAccionSobreUsuario.getCodigoUsuarioAfectado();
                accionSobreUsuarioListAccionSobreUsuario.setCodigoUsuarioAfectado(usuario);
                accionSobreUsuarioListAccionSobreUsuario = em.merge(accionSobreUsuarioListAccionSobreUsuario);
                if (oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListAccionSobreUsuario != null) {
                    oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListAccionSobreUsuario.getAccionSobreUsuarioList().remove(accionSobreUsuarioListAccionSobreUsuario);
                    oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListAccionSobreUsuario = em.merge(oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListAccionSobreUsuario);
                }
            }
            for (Realiza realizaListRealiza : usuario.getRealizaList()) {
                Usuario oldUsuarioOfRealizaListRealiza = realizaListRealiza.getUsuario();
                realizaListRealiza.setUsuario(usuario);
                realizaListRealiza = em.merge(realizaListRealiza);
                if (oldUsuarioOfRealizaListRealiza != null) {
                    oldUsuarioOfRealizaListRealiza.getRealizaList().remove(realizaListRealiza);
                    oldUsuarioOfRealizaListRealiza = em.merge(oldUsuarioOfRealizaListRealiza);
                }
            }
            for (Opinion opinionListOpinion : usuario.getOpinionList()) {
                Usuario oldNombreUsuarioOfOpinionListOpinion = opinionListOpinion.getNombreUsuario();
                opinionListOpinion.setNombreUsuario(usuario);
                opinionListOpinion = em.merge(opinionListOpinion);
                if (oldNombreUsuarioOfOpinionListOpinion != null) {
                    oldNombreUsuarioOfOpinionListOpinion.getOpinionList().remove(opinionListOpinion);
                    oldNombreUsuarioOfOpinionListOpinion = em.merge(oldNombreUsuarioOfOpinionListOpinion);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findUsuario(usuario.getNombreUsuario()) != null) {
                throw new PreexistingEntityException("Usuario " + usuario + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuario usuario) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario persistentUsuario = em.find(Usuario.class, usuario.getNombreUsuario());
            List<Repositorio> repositorioListOld = persistentUsuario.getRepositorioList();
            List<Repositorio> repositorioListNew = usuario.getRepositorioList();
            List<Repositorio> repositorioList1Old = persistentUsuario.getRepositorioList1();
            List<Repositorio> repositorioList1New = usuario.getRepositorioList1();
            List<AccionSobreUsuario> accionSobreUsuarioListOld = persistentUsuario.getAccionSobreUsuarioList();
            List<AccionSobreUsuario> accionSobreUsuarioListNew = usuario.getAccionSobreUsuarioList();
            List<Realiza> realizaListOld = persistentUsuario.getRealizaList();
            List<Realiza> realizaListNew = usuario.getRealizaList();
            List<Opinion> opinionListOld = persistentUsuario.getOpinionList();
            List<Opinion> opinionListNew = usuario.getOpinionList();
            List<String> illegalOrphanMessages = null;
            for (Repositorio repositorioList1OldRepositorio : repositorioList1Old) {
                if (!repositorioList1New.contains(repositorioList1OldRepositorio)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Repositorio " + repositorioList1OldRepositorio + " since its usuario field is not nullable.");
                }
            }
            for (Realiza realizaListOldRealiza : realizaListOld) {
                if (!realizaListNew.contains(realizaListOldRealiza)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Realiza " + realizaListOldRealiza + " since its usuario field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Repositorio> attachedRepositorioListNew = new ArrayList<Repositorio>();
            for (Repositorio repositorioListNewRepositorioToAttach : repositorioListNew) {
                repositorioListNewRepositorioToAttach = em.getReference(repositorioListNewRepositorioToAttach.getClass(), repositorioListNewRepositorioToAttach.getRepositorioPK());
                attachedRepositorioListNew.add(repositorioListNewRepositorioToAttach);
            }
            repositorioListNew = attachedRepositorioListNew;
            usuario.setRepositorioList(repositorioListNew);
            List<Repositorio> attachedRepositorioList1New = new ArrayList<Repositorio>();
            for (Repositorio repositorioList1NewRepositorioToAttach : repositorioList1New) {
                repositorioList1NewRepositorioToAttach = em.getReference(repositorioList1NewRepositorioToAttach.getClass(), repositorioList1NewRepositorioToAttach.getRepositorioPK());
                attachedRepositorioList1New.add(repositorioList1NewRepositorioToAttach);
            }
            repositorioList1New = attachedRepositorioList1New;
            usuario.setRepositorioList1(repositorioList1New);
            List<AccionSobreUsuario> attachedAccionSobreUsuarioListNew = new ArrayList<AccionSobreUsuario>();
            for (AccionSobreUsuario accionSobreUsuarioListNewAccionSobreUsuarioToAttach : accionSobreUsuarioListNew) {
                accionSobreUsuarioListNewAccionSobreUsuarioToAttach = em.getReference(accionSobreUsuarioListNewAccionSobreUsuarioToAttach.getClass(), accionSobreUsuarioListNewAccionSobreUsuarioToAttach.getCodigoAccion());
                attachedAccionSobreUsuarioListNew.add(accionSobreUsuarioListNewAccionSobreUsuarioToAttach);
            }
            accionSobreUsuarioListNew = attachedAccionSobreUsuarioListNew;
            usuario.setAccionSobreUsuarioList(accionSobreUsuarioListNew);
            List<Realiza> attachedRealizaListNew = new ArrayList<Realiza>();
            for (Realiza realizaListNewRealizaToAttach : realizaListNew) {
                realizaListNewRealizaToAttach = em.getReference(realizaListNewRealizaToAttach.getClass(), realizaListNewRealizaToAttach.getRealizaPK());
                attachedRealizaListNew.add(realizaListNewRealizaToAttach);
            }
            realizaListNew = attachedRealizaListNew;
            usuario.setRealizaList(realizaListNew);
            List<Opinion> attachedOpinionListNew = new ArrayList<Opinion>();
            for (Opinion opinionListNewOpinionToAttach : opinionListNew) {
                opinionListNewOpinionToAttach = em.getReference(opinionListNewOpinionToAttach.getClass(), opinionListNewOpinionToAttach.getOpinionPK());
                attachedOpinionListNew.add(opinionListNewOpinionToAttach);
            }
            opinionListNew = attachedOpinionListNew;
            usuario.setOpinionList(opinionListNew);
            usuario = em.merge(usuario);
            for (Repositorio repositorioListOldRepositorio : repositorioListOld) {
                if (!repositorioListNew.contains(repositorioListOldRepositorio)) {
                    repositorioListOldRepositorio.getUsuarioList().remove(usuario);
                    repositorioListOldRepositorio = em.merge(repositorioListOldRepositorio);
                }
            }
            for (Repositorio repositorioListNewRepositorio : repositorioListNew) {
                if (!repositorioListOld.contains(repositorioListNewRepositorio)) {
                    repositorioListNewRepositorio.getUsuarioList().add(usuario);
                    repositorioListNewRepositorio = em.merge(repositorioListNewRepositorio);
                }
            }
            for (Repositorio repositorioList1NewRepositorio : repositorioList1New) {
                if (!repositorioList1Old.contains(repositorioList1NewRepositorio)) {
                    Usuario oldUsuarioOfRepositorioList1NewRepositorio = repositorioList1NewRepositorio.getUsuario();
                    repositorioList1NewRepositorio.setUsuario(usuario);
                    repositorioList1NewRepositorio = em.merge(repositorioList1NewRepositorio);
                    if (oldUsuarioOfRepositorioList1NewRepositorio != null && !oldUsuarioOfRepositorioList1NewRepositorio.equals(usuario)) {
                        oldUsuarioOfRepositorioList1NewRepositorio.getRepositorioList1().remove(repositorioList1NewRepositorio);
                        oldUsuarioOfRepositorioList1NewRepositorio = em.merge(oldUsuarioOfRepositorioList1NewRepositorio);
                    }
                }
            }
            for (AccionSobreUsuario accionSobreUsuarioListOldAccionSobreUsuario : accionSobreUsuarioListOld) {
                if (!accionSobreUsuarioListNew.contains(accionSobreUsuarioListOldAccionSobreUsuario)) {
                    accionSobreUsuarioListOldAccionSobreUsuario.setCodigoUsuarioAfectado(null);
                    accionSobreUsuarioListOldAccionSobreUsuario = em.merge(accionSobreUsuarioListOldAccionSobreUsuario);
                }
            }
            for (AccionSobreUsuario accionSobreUsuarioListNewAccionSobreUsuario : accionSobreUsuarioListNew) {
                if (!accionSobreUsuarioListOld.contains(accionSobreUsuarioListNewAccionSobreUsuario)) {
                    Usuario oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario = accionSobreUsuarioListNewAccionSobreUsuario.getCodigoUsuarioAfectado();
                    accionSobreUsuarioListNewAccionSobreUsuario.setCodigoUsuarioAfectado(usuario);
                    accionSobreUsuarioListNewAccionSobreUsuario = em.merge(accionSobreUsuarioListNewAccionSobreUsuario);
                    if (oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario != null && !oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario.equals(usuario)) {
                        oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario.getAccionSobreUsuarioList().remove(accionSobreUsuarioListNewAccionSobreUsuario);
                        oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario = em.merge(oldCodigoUsuarioAfectadoOfAccionSobreUsuarioListNewAccionSobreUsuario);
                    }
                }
            }
            for (Realiza realizaListNewRealiza : realizaListNew) {
                if (!realizaListOld.contains(realizaListNewRealiza)) {
                    Usuario oldUsuarioOfRealizaListNewRealiza = realizaListNewRealiza.getUsuario();
                    realizaListNewRealiza.setUsuario(usuario);
                    realizaListNewRealiza = em.merge(realizaListNewRealiza);
                    if (oldUsuarioOfRealizaListNewRealiza != null && !oldUsuarioOfRealizaListNewRealiza.equals(usuario)) {
                        oldUsuarioOfRealizaListNewRealiza.getRealizaList().remove(realizaListNewRealiza);
                        oldUsuarioOfRealizaListNewRealiza = em.merge(oldUsuarioOfRealizaListNewRealiza);
                    }
                }
            }
            for (Opinion opinionListOldOpinion : opinionListOld) {
                if (!opinionListNew.contains(opinionListOldOpinion)) {
                    opinionListOldOpinion.setNombreUsuario(null);
                    opinionListOldOpinion = em.merge(opinionListOldOpinion);
                }
            }
            for (Opinion opinionListNewOpinion : opinionListNew) {
                if (!opinionListOld.contains(opinionListNewOpinion)) {
                    Usuario oldNombreUsuarioOfOpinionListNewOpinion = opinionListNewOpinion.getNombreUsuario();
                    opinionListNewOpinion.setNombreUsuario(usuario);
                    opinionListNewOpinion = em.merge(opinionListNewOpinion);
                    if (oldNombreUsuarioOfOpinionListNewOpinion != null && !oldNombreUsuarioOfOpinionListNewOpinion.equals(usuario)) {
                        oldNombreUsuarioOfOpinionListNewOpinion.getOpinionList().remove(opinionListNewOpinion);
                        oldNombreUsuarioOfOpinionListNewOpinion = em.merge(oldNombreUsuarioOfOpinionListNewOpinion);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = usuario.getNombreUsuario();
                if (findUsuario(id) == null) {
                    throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario;
            try {
                usuario = em.getReference(Usuario.class, id);
                usuario.getNombreUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Repositorio> repositorioList1OrphanCheck = usuario.getRepositorioList1();
            for (Repositorio repositorioList1OrphanCheckRepositorio : repositorioList1OrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Repositorio " + repositorioList1OrphanCheckRepositorio + " in its repositorioList1 field has a non-nullable usuario field.");
            }
            List<Realiza> realizaListOrphanCheck = usuario.getRealizaList();
            for (Realiza realizaListOrphanCheckRealiza : realizaListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Realiza " + realizaListOrphanCheckRealiza + " in its realizaList field has a non-nullable usuario field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Repositorio> repositorioList = usuario.getRepositorioList();
            for (Repositorio repositorioListRepositorio : repositorioList) {
                repositorioListRepositorio.getUsuarioList().remove(usuario);
                repositorioListRepositorio = em.merge(repositorioListRepositorio);
            }
            List<AccionSobreUsuario> accionSobreUsuarioList = usuario.getAccionSobreUsuarioList();
            for (AccionSobreUsuario accionSobreUsuarioListAccionSobreUsuario : accionSobreUsuarioList) {
                accionSobreUsuarioListAccionSobreUsuario.setCodigoUsuarioAfectado(null);
                accionSobreUsuarioListAccionSobreUsuario = em.merge(accionSobreUsuarioListAccionSobreUsuario);
            }
            List<Opinion> opinionList = usuario.getOpinionList();
            for (Opinion opinionListOpinion : opinionList) {
                opinionListOpinion.setNombreUsuario(null);
                opinionListOpinion = em.merge(opinionListOpinion);
            }
            em.remove(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuario> findUsuarioEntities() {
        return findUsuarioEntities(true, -1, -1);
    }

    public List<Usuario> findUsuarioEntities(int maxResults, int firstResult) {
        return findUsuarioEntities(false, maxResults, firstResult);
    }

    private List<Usuario> findUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuario.class));
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

    public Usuario findUsuario(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuario> rt = cq.from(Usuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
