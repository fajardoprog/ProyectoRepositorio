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
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@Entity
@Table(name = "solicita_acceso")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SolicitaAcceso.findAll", query = "SELECT s FROM SolicitaAcceso s"),
    @NamedQuery(name = "SolicitaAcceso.findByCodSolicitud", query = "SELECT s FROM SolicitaAcceso s WHERE s.codSolicitud = :codSolicitud")})
public class SolicitaAcceso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_solicitud")
    private Integer codSolicitud;
    @JoinColumns({
        @JoinColumn(name = "nombre_usuario", referencedColumnName = "nombre_usuario"),
        @JoinColumn(name = "nombre_repositorio", referencedColumnName = "nombre_repositorio")})
    @ManyToOne(optional = false)
    private Repositorio repositorio;

    public SolicitaAcceso() {
    }

    public SolicitaAcceso(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
    }

    public Integer getCodSolicitud() {
        return codSolicitud;
    }

    public void setCodSolicitud(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
    }

    public Repositorio getRepositorio() {
        return repositorio;
    }

    public void setRepositorio(Repositorio repositorio) {
        this.repositorio = repositorio;
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
