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
@Table(name = "accionsobrerepositorio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccionSobreRepositorio.findAll", query = "SELECT a FROM AccionSobreRepositorio a"),
    @NamedQuery(name = "AccionSobreRepositorio.findByCodigoAccion", query = "SELECT a FROM AccionSobreRepositorio a WHERE a.codigoAccion = :codigoAccion"),
    @NamedQuery(name = "AccionSobreRepositorio.findByCodigoUsuarioAfectado", query = "SELECT a FROM AccionSobreRepositorio a WHERE a.codigoUsuarioAfectado = :codigoUsuarioAfectado"),
    @NamedQuery(name = "AccionSobreRepositorio.findByCodigoRepositorioAfectado", query = "SELECT a FROM AccionSobreRepositorio a WHERE a.codigoRepositorioAfectado = :codigoRepositorioAfectado"),
    @NamedQuery(name = "AccionSobreRepositorio.findByTipo", query = "SELECT a FROM AccionSobreRepositorio a WHERE a.tipo = :tipo")})
public class AccionSobreRepositorio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo_accion")
    private Integer codigoAccion;
    @Size(max = 25)
    @Column(name = "codigo_usuario_afectado")
    private String codigoUsuarioAfectado;
    @Size(max = 25)
    @Column(name = "codigo_repositorio_afectado")
    private String codigoRepositorioAfectado;
    @Size(max = 25)
    @Column(name = "tipo")
    private String tipo;

    public AccionSobreRepositorio() {
    }

    public AccionSobreRepositorio(Integer codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    public Integer getCodigoAccion() {
        return codigoAccion;
    }

    public void setCodigoAccion(Integer codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    public String getCodigoUsuarioAfectado() {
        return codigoUsuarioAfectado;
    }

    public void setCodigoUsuarioAfectado(String codigoUsuarioAfectado) {
        this.codigoUsuarioAfectado = codigoUsuarioAfectado;
    }

    public String getCodigoRepositorioAfectado() {
        return codigoRepositorioAfectado;
    }

    public void setCodigoRepositorioAfectado(String codigoRepositorioAfectado) {
        this.codigoRepositorioAfectado = codigoRepositorioAfectado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
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
        if (!(object instanceof AccionSobreRepositorio)) {
            return false;
        }
        AccionSobreRepositorio other = (AccionSobreRepositorio) object;
        if ((this.codigoAccion == null && other.codigoAccion != null) || (this.codigoAccion != null && !this.codigoAccion.equals(other.codigoAccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.AccionSobreRepositorio[ codigoAccion=" + codigoAccion + " ]";
    }
    
}
