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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@Entity
@Table(name = "accionsobrearchivo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccionSobreArchivo.findAll", query = "SELECT a FROM AccionSobreArchivo a"),
    @NamedQuery(name = "AccionSobreArchivo.findByCodigoAccion", query = "SELECT a FROM AccionSobreArchivo a WHERE a.codigoAccion = :codigoAccion"),
    @NamedQuery(name = "AccionSobreArchivo.findByTipo", query = "SELECT a FROM AccionSobreArchivo a WHERE a.tipo = :tipo")})
public class AccionSobreArchivo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo_accion")
    private Integer codigoAccion;
    @Size(max = 25)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumns({
        @JoinColumn(name = "codigo_usuario_afectado", referencedColumnName = "nombre_usuario"),
        @JoinColumn(name = "codigo_repositorio_afectado", referencedColumnName = "nombre_repositorio"),
        @JoinColumn(name = "nombre_archivo", referencedColumnName = "nombre_archivo")})
    @ManyToOne
    private Archivo archivo;

    public AccionSobreArchivo() {
    }

    public AccionSobreArchivo(Integer codigoAccion) {
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

    public Archivo getArchivo() {
        return archivo;
    }

    public void setArchivo(Archivo archivo) {
        this.archivo = archivo;
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
        if (!(object instanceof AccionSobreArchivo)) {
            return false;
        }
        AccionSobreArchivo other = (AccionSobreArchivo) object;
        if ((this.codigoAccion == null && other.codigoAccion != null) || (this.codigoAccion != null && !this.codigoAccion.equals(other.codigoAccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.AccionSobreArchivo[ codigoAccion=" + codigoAccion + " ]";
    }
    
}
