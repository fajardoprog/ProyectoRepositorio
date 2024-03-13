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
    @NamedQuery(name = "Colaboradores.findAll", query = "SELECT c FROM Colaboradores c"),
    @NamedQuery(name = "Colaboradores.findByNombreUsuarioColaborador", query = "SELECT c FROM Colaboradores c WHERE c.colaboradoresPK.nombreUsuarioColaborador = :nombreUsuarioColaborador"),
    @NamedQuery(name = "Colaboradores.findByNombreUsuarioColaborado", query = "SELECT c FROM Colaboradores c WHERE c.colaboradoresPK.nombreUsuarioColaborado = :nombreUsuarioColaborado"),
    @NamedQuery(name = "Colaboradores.findByNombreRepositorioColaborado", query = "SELECT c FROM Colaboradores c WHERE c.colaboradoresPK.nombreRepositorioColaborado = :nombreRepositorioColaborado")})
public class Colaboradores implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ColaboradoresPK colaboradoresPK;

    public Colaboradores() {
    }

    public Colaboradores(ColaboradoresPK colaboradoresPK) {
        this.colaboradoresPK = colaboradoresPK;
    }

    public Colaboradores(String nombreUsuarioColaborador, String nombreUsuarioColaborado, String nombreRepositorioColaborado) {
        this.colaboradoresPK = new ColaboradoresPK(nombreUsuarioColaborador, nombreUsuarioColaborado, nombreRepositorioColaborado);
    }

    public ColaboradoresPK getColaboradoresPK() {
        return colaboradoresPK;
    }

    public void setColaboradoresPK(ColaboradoresPK colaboradoresPK) {
        this.colaboradoresPK = colaboradoresPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (colaboradoresPK != null ? colaboradoresPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Colaboradores)) {
            return false;
        }
        Colaboradores other = (Colaboradores) object;
        if ((this.colaboradoresPK == null && other.colaboradoresPK != null) || (this.colaboradoresPK != null && !this.colaboradoresPK.equals(other.colaboradoresPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Colaboradores[ colaboradoresPK=" + colaboradoresPK + " ]";
    }
    
}
