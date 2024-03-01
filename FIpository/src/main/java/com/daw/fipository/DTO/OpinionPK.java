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
 * @author José Antonio Fajardo Naranjo
 */
@Embeddable
public class OpinionPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario_opinado")
    private String nombreUsuarioOpinado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_repositorio")
    private String nombreRepositorio;

    public OpinionPK() {
    }

    public OpinionPK(String nombreUsuarioOpinado, String nombreRepositorio) {
        this.nombreUsuarioOpinado = nombreUsuarioOpinado;
        this.nombreRepositorio = nombreRepositorio;
    }

    public String getNombreUsuarioOpinado() {
        return nombreUsuarioOpinado;
    }

    public void setNombreUsuarioOpinado(String nombreUsuarioOpinado) {
        this.nombreUsuarioOpinado = nombreUsuarioOpinado;
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
        hash += (nombreUsuarioOpinado != null ? nombreUsuarioOpinado.hashCode() : 0);
        hash += (nombreRepositorio != null ? nombreRepositorio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OpinionPK)) {
            return false;
        }
        OpinionPK other = (OpinionPK) object;
        if ((this.nombreUsuarioOpinado == null && other.nombreUsuarioOpinado != null) || (this.nombreUsuarioOpinado != null && !this.nombreUsuarioOpinado.equals(other.nombreUsuarioOpinado))) {
            return false;
        }
        if ((this.nombreRepositorio == null && other.nombreRepositorio != null) || (this.nombreRepositorio != null && !this.nombreRepositorio.equals(other.nombreRepositorio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.OpinionPK[ nombreUsuarioOpinado=" + nombreUsuarioOpinado + ", nombreRepositorio=" + nombreRepositorio + " ]";
    }
    
}
