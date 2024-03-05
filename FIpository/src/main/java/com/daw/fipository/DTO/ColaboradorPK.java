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
public class ColaboradorPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario_colaborador")
    private String nombreUsuarioColaborador;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario_colaborado")
    private String nombreUsuarioColaborado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_repositorio_colaborado")
    private String nombreRepositorioColaborado;

    public ColaboradorPK() {
    }

    public ColaboradorPK(String nombreUsuarioColaborador, String nombreUsuarioColaborado, String nombreRepositorioColaborado) {
        this.nombreUsuarioColaborador = nombreUsuarioColaborador;
        this.nombreUsuarioColaborado = nombreUsuarioColaborado;
        this.nombreRepositorioColaborado = nombreRepositorioColaborado;
    }

    public String getNombreUsuarioColaborador() {
        return nombreUsuarioColaborador;
    }

    public void setNombreUsuarioColaborador(String nombreUsuarioColaborador) {
        this.nombreUsuarioColaborador = nombreUsuarioColaborador;
    }

    public String getNombreUsuarioColaborado() {
        return nombreUsuarioColaborado;
    }

    public void setNombreUsuarioColaborado(String nombreUsuarioColaborado) {
        this.nombreUsuarioColaborado = nombreUsuarioColaborado;
    }

    public String getNombreRepositorioColaborado() {
        return nombreRepositorioColaborado;
    }

    public void setNombreRepositorioColaborado(String nombreRepositorioColaborado) {
        this.nombreRepositorioColaborado = nombreRepositorioColaborado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombreUsuarioColaborador != null ? nombreUsuarioColaborador.hashCode() : 0);
        hash += (nombreUsuarioColaborado != null ? nombreUsuarioColaborado.hashCode() : 0);
        hash += (nombreRepositorioColaborado != null ? nombreRepositorioColaborado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ColaboradorPK)) {
            return false;
        }
        ColaboradorPK other = (ColaboradorPK) object;
        if ((this.nombreUsuarioColaborador == null && other.nombreUsuarioColaborador != null) || (this.nombreUsuarioColaborador != null && !this.nombreUsuarioColaborador.equals(other.nombreUsuarioColaborador))) {
            return false;
        }
        if ((this.nombreUsuarioColaborado == null && other.nombreUsuarioColaborado != null) || (this.nombreUsuarioColaborado != null && !this.nombreUsuarioColaborado.equals(other.nombreUsuarioColaborado))) {
            return false;
        }
        if ((this.nombreRepositorioColaborado == null && other.nombreRepositorioColaborado != null) || (this.nombreRepositorioColaborado != null && !this.nombreRepositorioColaborado.equals(other.nombreRepositorioColaborado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.ColaboradorPK[ nombreUsuarioColaborador=" + nombreUsuarioColaborador + ", nombreUsuarioColaborado=" + nombreUsuarioColaborado + ", nombreRepositorioColaborado=" + nombreRepositorioColaborado + " ]";
    }
    
}
