/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Lob;
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
@Table(name = "opinion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Opinion.findAll", query = "SELECT o FROM Opinion o"),
    @NamedQuery(name = "Opinion.findByNombreUsuario", query = "SELECT o FROM Opinion o WHERE o.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Opinion.findByNombreUsuarioOpinado", query = "SELECT o FROM Opinion o WHERE o.opinionPK.nombreUsuarioOpinado = :nombreUsuarioOpinado"),
    @NamedQuery(name = "Opinion.findByNombreRepositorio", query = "SELECT o FROM Opinion o WHERE o.opinionPK.nombreRepositorio = :nombreRepositorio"),
    @NamedQuery(name = "Opinion.findByEstrella", query = "SELECT o FROM Opinion o WHERE o.estrella = :estrella")})
public class Opinion implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OpinionPK opinionPK;
    @Size(max = 25)
    @Column(name = "nombre_usuario")
    private String nombreUsuario;
    @Column(name = "estrella")
    private Integer estrella;
    @Lob
    @Size(max = 65535)
    @Column(name = "valoracion")
    private String valoracion;

    public Opinion() {
    }

    public Opinion(OpinionPK opinionPK) {
        this.opinionPK = opinionPK;
    }

    public Opinion(String nombreUsuarioOpinado, String nombreRepositorio) {
        this.opinionPK = new OpinionPK(nombreUsuarioOpinado, nombreRepositorio);
    }

    public OpinionPK getOpinionPK() {
        return opinionPK;
    }

    public void setOpinionPK(OpinionPK opinionPK) {
        this.opinionPK = opinionPK;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public Integer getEstrella() {
        return estrella;
    }

    public void setEstrella(Integer estrella) {
        this.estrella = estrella;
    }

    public String getValoracion() {
        return valoracion;
    }

    public void setValoracion(String valoracion) {
        this.valoracion = valoracion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (opinionPK != null ? opinionPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Opinion)) {
            return false;
        }
        Opinion other = (Opinion) object;
        if ((this.opinionPK == null && other.opinionPK != null) || (this.opinionPK != null && !this.opinionPK.equals(other.opinionPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Opinion[ opinionPK=" + opinionPK + " ]";
    }
    
}
