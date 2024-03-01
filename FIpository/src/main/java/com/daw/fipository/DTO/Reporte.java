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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "reporte")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reporte.findAll", query = "SELECT r FROM Reporte r"),
    @NamedQuery(name = "Reporte.findByCodReporte", query = "SELECT r FROM Reporte r WHERE r.codReporte = :codReporte"),
    @NamedQuery(name = "Reporte.findByNombreUsuario", query = "SELECT r FROM Reporte r WHERE r.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Reporte.findByUsuarioReportado", query = "SELECT r FROM Reporte r WHERE r.usuarioReportado = :usuarioReportado"),
    @NamedQuery(name = "Reporte.findByFechaReporte", query = "SELECT r FROM Reporte r WHERE r.fechaReporte = :fechaReporte")})
public class Reporte implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_reporte")
    private Integer codReporte;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario")
    private String nombreUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "usuario_reportado")
    private String usuarioReportado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_reporte")
    @Temporal(TemporalType.DATE)
    private Date fechaReporte;

    public Reporte() {
    }

    public Reporte(Integer codReporte) {
        this.codReporte = codReporte;
    }

    public Reporte(Integer codReporte, String nombreUsuario, String usuarioReportado, Date fechaReporte) {
        this.codReporte = codReporte;
        this.nombreUsuario = nombreUsuario;
        this.usuarioReportado = usuarioReportado;
        this.fechaReporte = fechaReporte;
    }

    public Integer getCodReporte() {
        return codReporte;
    }

    public void setCodReporte(Integer codReporte) {
        this.codReporte = codReporte;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getUsuarioReportado() {
        return usuarioReportado;
    }

    public void setUsuarioReportado(String usuarioReportado) {
        this.usuarioReportado = usuarioReportado;
    }

    public Date getFechaReporte() {
        return fechaReporte;
    }

    public void setFechaReporte(Date fechaReporte) {
        this.fechaReporte = fechaReporte;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codReporte != null ? codReporte.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reporte)) {
            return false;
        }
        Reporte other = (Reporte) object;
        if ((this.codReporte == null && other.codReporte != null) || (this.codReporte != null && !this.codReporte.equals(other.codReporte))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Reporte[ codReporte=" + codReporte + " ]";
    }
    
}
