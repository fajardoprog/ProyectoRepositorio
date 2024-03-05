/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

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
    @NamedQuery(name = "Repositorio.findByPrivado", query = "SELECT r FROM Repositorio r WHERE r.privado = :privado"),
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
    @Column(name = "privado")
    private int privado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;

    public Repositorio() {
    }

    public Repositorio(RepositorioPK repositorioPK) {
        this.repositorioPK = repositorioPK;
    }

    public Repositorio(RepositorioPK repositorioPK, String descripcion, int privado, Date fechaCreacion) {
        this.repositorioPK = repositorioPK;
        this.descripcion = descripcion;
        this.privado = privado;
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

    public int getPrivado() {
        return privado;
    }

    public void setPrivado(int privado) {
        this.privado = privado;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
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
