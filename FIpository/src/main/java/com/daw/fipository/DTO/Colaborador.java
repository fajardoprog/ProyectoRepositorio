/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author IsmaelJJL
 */
@Entity
@Table(name = "colaboradores")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Colaborador.findAll", query = "SELECT c FROM Colaborador c"),
    @NamedQuery(name = "Colaborador.findByNombreUsuarioColaborador", query = "SELECT c FROM Colaborador c WHERE c.colaboradorPK.nombreUsuarioColaborador = :nombreUsuarioColaborador"),
    @NamedQuery(name = "Colaborador.findByNombreUsuarioColaborado", query = "SELECT c FROM Colaborador c WHERE c.colaboradorPK.nombreUsuarioColaborado = :nombreUsuarioColaborado"),
    @NamedQuery(name = "Colaborador.findByNombreRepositorioColaborado", query = "SELECT c FROM Colaborador c WHERE c.colaboradorPK.nombreRepositorioColaborado = :nombreRepositorioColaborado")})
public class Colaborador implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ColaboradorPK colaboradorPK;

    public Colaborador() {
    }

    public Colaborador(ColaboradorPK colaboradorPK) {
        this.colaboradorPK = colaboradorPK;
    }

    public Colaborador(String nombreUsuarioColaborador, String nombreUsuarioColaborado, String nombreRepositorioColaborado) {
        this.colaboradorPK = new ColaboradorPK(nombreUsuarioColaborador, nombreUsuarioColaborado, nombreRepositorioColaborado);
    }

    public ColaboradorPK getColaboradorPK() {
        return colaboradorPK;
    }

    public void setColaboradorPK(ColaboradorPK colaboradorPK) {
        this.colaboradorPK = colaboradorPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (colaboradorPK != null ? colaboradorPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Colaborador)) {
            return false;
        }
        Colaborador other = (Colaborador) object;
        if ((this.colaboradorPK == null && other.colaboradorPK != null) || (this.colaboradorPK != null && !this.colaboradorPK.equals(other.colaboradorPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Colaborador[ colaboradorPK=" + colaboradorPK + " ]";
    }
    
}
