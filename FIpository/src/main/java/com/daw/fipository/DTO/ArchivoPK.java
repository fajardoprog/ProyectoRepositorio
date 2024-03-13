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
public class ArchivoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombre_archivo")
    private String nombreArchivo;
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

    public ArchivoPK() {
    }

    public ArchivoPK(String nombreArchivo, String nombreUsuario, String nombreRepositorio) {
        this.nombreArchivo = nombreArchivo;
        this.nombreUsuario = nombreUsuario;
        this.nombreRepositorio = nombreRepositorio;
    }

    public String getNombreArchivo() {
        return nombreArchivo;
    }

    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
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
        hash += (nombreArchivo != null ? nombreArchivo.hashCode() : 0);
        hash += (nombreUsuario != null ? nombreUsuario.hashCode() : 0);
        hash += (nombreRepositorio != null ? nombreRepositorio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ArchivoPK)) {
            return false;
        }
        ArchivoPK other = (ArchivoPK) object;
        if ((this.nombreArchivo == null && other.nombreArchivo != null) || (this.nombreArchivo != null && !this.nombreArchivo.equals(other.nombreArchivo))) {
            return false;
        }
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
        return "com.daw.fipository.DTO.ArchivoPK[ nombreArchivo=" + nombreArchivo + ", nombreUsuario=" + nombreUsuario + ", nombreRepositorio=" + nombreRepositorio + " ]";
    }
    
}
