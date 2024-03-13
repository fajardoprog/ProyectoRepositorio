/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author IsmaelJJL
 */
@Embeddable
public class RepositorioPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario")
    private String nombreUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_repositorio")
    private String nombreRepositorio;

    public RepositorioPK() {
    }

    public RepositorioPK(String nombreUsuario, String nombreRepositorio) {
        this.nombreUsuario = nombreUsuario;
        this.nombreRepositorio = nombreRepositorio;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getNombreRepositorio() {
        return nombreRepositorio;
    }

    public void setNombreRepositorio(String nombreRepositorio) {
        this.nombreRepositorio = nombreRepositorio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombreUsuario != null ? nombreUsuario.hashCode() : 0);
        hash += (nombreRepositorio != null ? nombreRepositorio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RepositorioPK)) {
            return false;
        }
        RepositorioPK other = (RepositorioPK) object;
        if ((this.nombreUsuario == null && other.nombreUsuario != null) || (this.nombreUsuario != null && !this.nombreUsuario.equals(other.nombreUsuario))) {
            return false;
        }
        if ((this.nombreRepositorio == null && other.nombreRepositorio != null) || (this.nombreRepositorio != null && !this.nombreRepositorio.equals(other.nombreRepositorio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.RepositorioPK[ nombreUsuario=" + nombreUsuario + ", nombreRepositorio=" + nombreRepositorio + " ]";
    }
    
}
