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
 * @author IsmaelJJL
 */
@Entity
@Table(name = "repositorio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Repositorio.findAll", query = "SELECT r FROM Repositorio r"),
    @NamedQuery(name = "Repositorio.findByNombreUsuario", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Repositorio.findByNombreRepositorio", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreRepositorio = :nombreRepositorio"),
    @NamedQuery(name = "Repositorio.findByDescripcion", query = "SELECT r FROM Repositorio r WHERE r.descripcion = :descripcion"),
    @NamedQuery(name = "Repositorio.findByFechaCreacion", query = "SELECT r FROM Repositorio r WHERE r.fechaCreacion = :fechaCreacion"),
    @NamedQuery(name = "Repositorio.findByPrivado", query = "SELECT r FROM Repositorio r WHERE r.privado = :privado"),
    @NamedQuery(name = "Repositorio.findByNumeroVisitas", query = "SELECT r FROM Repositorio r WHERE r.numeroVisitas = :numeroVisitas"),
    @NamedQuery(name = "Repositorio.ordenadosPorFecha", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreRepositorio LIKE '%:nombreRepositorio%' ORDER BY r.fechaCreacion"),
    @NamedQuery(name = "Repositorio.ordenadosPorNombreRepositorio", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreRepositorio LIKE '%:nombreRepositorio%' ORDER BY r.repositorioPK.nombreRepositorio"),
    @NamedQuery(name = "Repositorio.ordenadosPorNumeroVisitas", query = "SELECT r FROM Repositorio r WHERE r.repositorioPK.nombreRepositorio LIKE '%:nombreRepositorio%' ORDER BY r")
})
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
    @Column(name = "privado")
    private Integer privado;
    @Column(name = "numero_visitas")
    private Integer numeroVisitas;

    public Repositorio() {
    }

    public Repositorio(RepositorioPK repositorioPK, String descripcion, Date fechaCreacion, Integer privado, Integer numeroVisitas) {
        this.repositorioPK = repositorioPK;
        this.descripcion = descripcion;
        this.fechaCreacion = fechaCreacion;
        this.privado = privado;
        this.numeroVisitas = numeroVisitas;
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

    public Integer getPrivado() {
        return privado;
    }

    public void setPrivado(Integer privado) {
        this.privado = privado;
    }

    public Integer getNumeroVisitas() {
        return numeroVisitas;
    }

    public void setNumeroVisitas(Integer numeroVisitas) {
        this.numeroVisitas = numeroVisitas;
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
