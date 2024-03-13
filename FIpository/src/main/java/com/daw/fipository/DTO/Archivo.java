/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "archivo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Archivo.findAll", query = "SELECT a FROM Archivo a"),
    @NamedQuery(name = "Archivo.findByNombreArchivo", query = "SELECT a FROM Archivo a WHERE a.archivoPK.nombreArchivo = :nombreArchivo"),
    @NamedQuery(name = "Archivo.findByFechaCreacion", query = "SELECT a FROM Archivo a WHERE a.fechaCreacion = :fechaCreacion"),
    @NamedQuery(name = "Archivo.findByCarpeta", query = "SELECT a FROM Archivo a WHERE a.carpeta = :carpeta"),
    @NamedQuery(name = "Archivo.findByNombreUsuario", query = "SELECT a FROM Archivo a WHERE a.archivoPK.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Archivo.findByNombreRepositorio", query = "SELECT a FROM Archivo a WHERE a.archivoPK.nombreRepositorio = :nombreRepositorio"),
    @NamedQuery(name = "Archivo.findByNumArchivos", query = "SELECT a FROM Archivo a WHERE a.numArchivos = :numArchivos"),
    @NamedQuery(name = "Archivo.findByPeso", query = "SELECT a FROM Archivo a WHERE a.peso = :peso"),
    @NamedQuery(name = "Archivo.findByColor", query = "SELECT a FROM Archivo a WHERE a.color = :color"),
    @NamedQuery(name = "Archivo.carpetasUsuario", query = "SELECT a FROM Archivo a WHERE a.archivoPK.nombreRepositorio = :nombreRepositorio AND a.archivoPK.nombreUsuario = :nombreUsuario AND a.carpeta = true ORDER BY a.carpeta")
})
public class Archivo implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ArchivoPK archivoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_creacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "carpeta")
    private boolean carpeta;
    @Column(name = "num_archivos")
    private Integer numArchivos;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "peso")
    private Double peso;
    @Size(max = 20)
    @Column(name = "color")
    private String color;

    public Archivo() {
    }

    public Archivo(ArchivoPK archivoPK) {
        this.archivoPK = archivoPK;
    }

    public Archivo(ArchivoPK archivoPK, Date fechaCreacion, boolean carpeta) {
        this.archivoPK = archivoPK;
        this.fechaCreacion = fechaCreacion;
        this.carpeta = carpeta;
    }

    public Archivo(String nombreArchivo, String nombreUsuario, String nombreRepositorio) {
        this.archivoPK = new ArchivoPK(nombreArchivo, nombreUsuario, nombreRepositorio);
    }

    public Archivo(ArchivoPK archivoPK, Date fechaCreacion, boolean carpeta, double peso) {
        this.archivoPK = archivoPK;
        this.fechaCreacion = fechaCreacion;
        this.carpeta = carpeta;
        this.peso = peso;
    }

    public Archivo(ArchivoPK archivoPK, Date fechaCreacion, boolean carpeta, Integer numArchivos, String color) {
        this.archivoPK = archivoPK;
        this.fechaCreacion = fechaCreacion;
        this.carpeta = carpeta;
        this.numArchivos = numArchivos;
        this.color = color;
    }

    
    
    public ArchivoPK getArchivoPK() {
        return archivoPK;
    }

    public void setArchivoPK(ArchivoPK archivoPK) {
        this.archivoPK = archivoPK;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public boolean getCarpeta() {
        return carpeta;
    }

    public void setCarpeta(boolean carpeta) {
        this.carpeta = carpeta;
    }

    public Integer getNumArchivos() {
        return numArchivos;
    }

    public void setNumArchivos(Integer numArchivos) {
        this.numArchivos = numArchivos;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (archivoPK != null ? archivoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Archivo)) {
            return false;
        }
        Archivo other = (Archivo) object;
        if ((this.archivoPK == null && other.archivoPK != null) || (this.archivoPK != null && !this.archivoPK.equals(other.archivoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Archivo[ archivoPK=" + archivoPK + " ]";
    }
    
}
