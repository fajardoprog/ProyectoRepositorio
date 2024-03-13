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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author IsmaelJJL
 */
@Entity
@Table(name = "solicita_acceso")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SolicitaAcceso.findAll", query = "SELECT s FROM SolicitaAcceso s"),
    @NamedQuery(name = "SolicitaAcceso.findByCodSolicitud", query = "SELECT s FROM SolicitaAcceso s WHERE s.codSolicitud = :codSolicitud"),
    @NamedQuery(name = "SolicitaAcceso.findByNombreUsuario", query = "SELECT s FROM SolicitaAcceso s WHERE s.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "SolicitaAcceso.findByNombreRepositorio", query = "SELECT s FROM SolicitaAcceso s WHERE s.nombreRepositorio = :nombreRepositorio")})
public class SolicitaAcceso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_solicitud")
    private Integer codSolicitud;
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

    public SolicitaAcceso() {
    }

    public SolicitaAcceso(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
    }

    public SolicitaAcceso(Integer codSolicitud, String nombreUsuario, String nombreRepositorio) {
        this.codSolicitud = codSolicitud;
        this.nombreUsuario = nombreUsuario;
        this.nombreRepositorio = nombreRepositorio;
    }

    public Integer getCodSolicitud() {
        return codSolicitud;
    }

    public void setCodSolicitud(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
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
        hash += (codSolicitud != null ? codSolicitud.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SolicitaAcceso)) {
            return false;
        }
        SolicitaAcceso other = (SolicitaAcceso) object;
        if ((this.codSolicitud == null && other.codSolicitud != null) || (this.codSolicitud != null && !this.codSolicitud.equals(other.codSolicitud))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.SolicitaAcceso[ codSolicitud=" + codSolicitud + " ]";
    }
    
}
