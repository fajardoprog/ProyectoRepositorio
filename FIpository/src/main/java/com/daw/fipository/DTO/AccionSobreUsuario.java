/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@Entity
@Table(name = "accionsobreusuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccionSobreUsuario.findAll", query = "SELECT a FROM AccionSobreUsuario a"),
    @NamedQuery(name = "AccionSobreUsuario.findByCodigoAccion", query = "SELECT a FROM AccionSobreUsuario a WHERE a.codigoAccion = :codigoAccion"),
    @NamedQuery(name = "AccionSobreUsuario.findByTipo", query = "SELECT a FROM AccionSobreUsuario a WHERE a.tipo = :tipo")})
public class AccionSobreUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo_accion")
    private Integer codigoAccion;
    @Size(max = 25)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumn(name = "codigo_usuario_afectado", referencedColumnName = "nombre_usuario")
    @ManyToOne
    private Usuario codigoUsuarioAfectado;

    public AccionSobreUsuario() {
    }

    public AccionSobreUsuario(Integer codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    public Integer getCodigoAccion() {
        return codigoAccion;
    }

    public void setCodigoAccion(Integer codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Usuario getCodigoUsuarioAfectado() {
        return codigoUsuarioAfectado;
    }

    public void setCodigoUsuarioAfectado(Usuario codigoUsuarioAfectado) {
        this.codigoUsuarioAfectado = codigoUsuarioAfectado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigoAccion != null ? codigoAccion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccionSobreUsuario)) {
            return false;
        }
        AccionSobreUsuario other = (AccionSobreUsuario) object;
        if ((this.codigoAccion == null && other.codigoAccion != null) || (this.codigoAccion != null && !this.codigoAccion.equals(other.codigoAccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.AccionSobreUsuario[ codigoAccion=" + codigoAccion + " ]";
    }
    
}
