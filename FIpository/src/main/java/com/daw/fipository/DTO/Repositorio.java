/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@Entity
@Table(name = "repositorio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Repositorio.findAll", query = "SELECT r FROM Repositorio r"),
    @NamedQuery(name = "Repositorio.findByNombreUsuario", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Repositorio.findByNombreRepositorio", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreRepositorio = :nombreRepositorio"),
    @NamedQuery(name = "Repositorio.findByDescripcion", query = "SELECT r FROM Repositorio r WHERE r.descripcion = :descripcion"),
    @NamedQuery(name = "Repositorio.findByFechaCreacion", query = "SELECT r FROM Repositorio r WHERE r.fechaCreacion = :fechaCreacion")})
public class Repositorio implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RepositorioPK repositorioPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;
    @ManyToMany(mappedBy = "repositorioList")
    private List<Usuario> usuarioList;
    @JoinColumn(name = "nombre_usuario", referencedColumnName = "nombre_usuario", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Usuario usuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "repositorio")
    private List<Archivo> archivoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "repositorio")
    private List<SolicitaAcceso> solicitaAccesoList;
    @OneToMany(mappedBy = "repositorio")
    private List<AccionSobreRepositorio> accionSobreRepositorioList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "repositorio")
    private Opinion opinion;

    public Repositorio() {
    }

    public Repositorio(RepositorioPK repositorioPK) {
        this.repositorioPK = repositorioPK;
    }

    public Repositorio(RepositorioPK repositorioPK, String descripcion, Date fechaCreacion) {
        this.repositorioPK = repositorioPK;
        this.descripcion = descripcion;
        this.fechaCreacion = fechaCreacion;
    }

    public Repositorio(String nombreUsuario, String nombreRepositorio) {
        this.repositorioPK = new RepositorioPK(nombreUsuario, nombreRepositorio);
    }

    public RepositorioPK getRepositorioPK() {
        return repositorioPK;
    }

    public void setRepositorioPK(RepositorioPK repositorioPK) {
        this.repositorioPK = repositorioPK;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @XmlTransient
    public List<Archivo> getArchivoList() {
        return archivoList;
    }

    public void setArchivoList(List<Archivo> archivoList) {
        this.archivoList = archivoList;
    }

    @XmlTransient
    public List<SolicitaAcceso> getSolicitaAccesoList() {
        return solicitaAccesoList;
    }

    public void setSolicitaAccesoList(List<SolicitaAcceso> solicitaAccesoList) {
        this.solicitaAccesoList = solicitaAccesoList;
    }

    @XmlTransient
    public List<AccionSobreRepositorio> getAccionSobreRepositorioList() {
        return accionSobreRepositorioList;
    }

    public void setAccionSobreRepositorioList(List<AccionSobreRepositorio> accionSobreRepositorioList) {
        this.accionSobreRepositorioList = accionSobreRepositorioList;
    }

    public Opinion getOpinion() {
        return opinion;
    }

    public void setOpinion(Opinion opinion) {
        this.opinion = opinion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (repositorioPK != null ? repositorioPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Repositorio)) {
            return false;
        }
        Repositorio other = (Repositorio) object;
        if ((this.repositorioPK == null && other.repositorioPK != null) || (this.repositorioPK != null && !this.repositorioPK.equals(other.repositorioPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Repositorio[ repositorioPK=" + repositorioPK + " ]";
    }
    
}
