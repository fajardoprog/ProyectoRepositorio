/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author IsmaelJJL
 */
@Entity
@Table(name = "realiza")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Realiza.findAll", query = "SELECT r FROM Realiza r"),
    @NamedQuery(name = "Realiza.findByNombreUsuario", query = "SELECT r FROM Realiza r WHERE r.realizaPK.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Realiza.findByCodigoAccion", query = "SELECT r FROM Realiza r WHERE r.realizaPK.codigoAccion = :codigoAccion"),
    @NamedQuery(name = "Realiza.findByFechaRealizacion", query = "SELECT r FROM Realiza r WHERE r.realizaPK.fechaRealizacion = :fechaRealizacion"),
    @NamedQuery(name = "Realiza.findByTipoAccion", query = "SELECT r FROM Realiza r WHERE r.tipoAccion = :tipoAccion")})
public class Realiza implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RealizaPK realizaPK;
    @Size(max = 25)
    @Column(name = "tipo_accion")
    private String tipoAccion;

    public Realiza() {
    }

    public Realiza(RealizaPK realizaPK) {
        this.realizaPK = realizaPK;
    }

    public Realiza(String nombreUsuario, int codigoAccion, Date fechaRealizacion) {
        this.realizaPK = new RealizaPK(nombreUsuario, codigoAccion, fechaRealizacion);
    }

    public RealizaPK getRealizaPK() {
        return realizaPK;
    }

    public void setRealizaPK(RealizaPK realizaPK) {
        this.realizaPK = realizaPK;
    }

    public String getTipoAccion() {
        return tipoAccion;
    }

    public void setTipoAccion(String tipoAccion) {
        this.tipoAccion = tipoAccion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (realizaPK != null ? realizaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Realiza)) {
            return false;
        }
        Realiza other = (Realiza) object;
        if ((this.realizaPK == null && other.realizaPK != null) || (this.realizaPK != null && !this.realizaPK.equals(other.realizaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Realiza[ realizaPK=" + realizaPK + " ]";
    }
    
}
