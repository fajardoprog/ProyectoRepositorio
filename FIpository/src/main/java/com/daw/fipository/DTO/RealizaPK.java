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
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author IsmaelJJL
 */
@Embeddable
public class RealizaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario")
    private String nombreUsuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codigo_accion")
    private int codigoAccion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_realizacion")
    @Temporal(TemporalType.DATE)
    private Date fechaRealizacion;

    public RealizaPK() {
    }

    public RealizaPK(String nombreUsuario, int codigoAccion, Date fechaRealizacion) {
        this.nombreUsuario = nombreUsuario;
        this.codigoAccion = codigoAccion;
        this.fechaRealizacion = fechaRealizacion;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public int getCodigoAccion() {
        return codigoAccion;
    }

    public void setCodigoAccion(int codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    public Date getFechaRealizacion() {
        return fechaRealizacion;
    }

    public void setFechaRealizacion(Date fechaRealizacion) {
        this.fechaRealizacion = fechaRealizacion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombreUsuario != null ? nombreUsuario.hashCode() : 0);
        hash += (int) codigoAccion;
        hash += (fechaRealizacion != null ? fechaRealizacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RealizaPK)) {
            return false;
        }
        RealizaPK other = (RealizaPK) object;
        if ((this.nombreUsuario == null && other.nombreUsuario != null) || (this.nombreUsuario != null && !this.nombreUsuario.equals(other.nombreUsuario))) {
            return false;
        }
        if (this.codigoAccion != other.codigoAccion) {
            return false;
        }
        if ((this.fechaRealizacion == null && other.fechaRealizacion != null) || (this.fechaRealizacion != null && !this.fechaRealizacion.equals(other.fechaRealizacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.RealizaPK[ nombreUsuario=" + nombreUsuario + ", codigoAccion=" + codigoAccion + ", fechaRealizacion=" + fechaRealizacion + " ]";
    }
    
}
