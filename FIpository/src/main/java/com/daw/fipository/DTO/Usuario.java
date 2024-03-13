/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.DTO;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author IsmaelJJL
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findByNombreUsuario", query = "SELECT u FROM Usuario u WHERE u.nombreUsuario = :nombreUsuario"),
    @NamedQuery(name = "Usuario.findByPasswordUsuario", query = "SELECT u FROM Usuario u WHERE u.passwordUsuario = :passwordUsuario"),
    @NamedQuery(name = "Usuario.findByNombreCompleto", query = "SELECT u FROM Usuario u WHERE u.nombreCompleto = :nombreCompleto"),
    @NamedQuery(name = "Usuario.findByPrimerApellido", query = "SELECT u FROM Usuario u WHERE u.primerApellido = :primerApellido"),
    @NamedQuery(name = "Usuario.findBySegundoApellido", query = "SELECT u FROM Usuario u WHERE u.segundoApellido = :segundoApellido"),
    @NamedQuery(name = "Usuario.findByReputacion", query = "SELECT u FROM Usuario u WHERE u.reputacion = :reputacion"),
    @NamedQuery(name = "Usuario.findByCorreo", query = "SELECT u FROM Usuario u WHERE u.correo = :correo"),
    @NamedQuery(name = "Usuario.findByDescripcion", query = "SELECT u FROM Usuario u WHERE u.descripcion = :descripcion"),
    @NamedQuery(name = "Usuario.findByGenero", query = "SELECT u FROM Usuario u WHERE u.genero = :genero"),
    @NamedQuery(name = "Usuario.findByFoto", query = "SELECT u FROM Usuario u WHERE u.foto = :foto"),
    @NamedQuery(name = "Usuario.findByFechaNacimiento", query = "SELECT u FROM Usuario u WHERE u.fechaNacimiento = :fechaNacimiento"),
    @NamedQuery(name = "Usuario.findByNumeroReporte", query = "SELECT u FROM Usuario u WHERE u.numeroReporte = :numeroReporte"),
    @NamedQuery(name = "Usuario.findByNumeroLike", query = "SELECT u FROM Usuario u WHERE u.numeroLike = :numeroLike"),
    @NamedQuery(name = "Usuario.findByAdmin", query = "SELECT u FROM Usuario u WHERE u.admin = :admin"),
    @NamedQuery(name = "Usuario.ordenadosPorReputacion", query = "SELECT u FROM Usuario u WHERE u.nombreUsuario LIKE '%:nombreUsuario%'"),
    @NamedQuery(name = "Usuario.ordenadorPorEdad", query = "SELECT u FROM Usuario u WHERE u.nombreUsuario LIKE '%:nombreUsuario%'"),
    @NamedQuery(name = "Usuario.ordenadorPorNombre", query = "SELECT u FROM Usuario u WHERE u.nombreUsuario LIKE '%:nombreUsuario%'")
})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombre_usuario")
    private String nombreUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "password_usuario")
    private String passwordUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombre_completo")
    private String nombreCompleto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "primer_apellido")
    private String primerApellido;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "segundo_apellido")
    private String segundoApellido;
    @Column(name = "reputacion")
    private Integer reputacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "correo")
    private String correo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "genero")
    private String genero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "foto")
    private String foto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_nacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @Column(name = "numero_Reporte")
    private Integer numeroReporte;
    @Column(name = "numero_Like")
    private Integer numeroLike;
    @Basic(optional = false)
    @NotNull
    @Column(name = "admin")
    private boolean admin;

    public Usuario() {
    }

    public Usuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public Usuario(String nombreUsuario, String passwordUsuario, String nombreCompleto, String primerApellido, String segundoApellido, String correo, String descripcion, String genero, String foto, Date fechaNacimiento, boolean admin) {
        this.nombreUsuario = nombreUsuario;
        this.passwordUsuario = passwordUsuario;
        this.nombreCompleto = nombreCompleto;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.correo = correo;
        this.descripcion = descripcion;
        this.genero = genero;
        this.foto = foto;
        this.fechaNacimiento = fechaNacimiento;
        this.admin = admin;
    }

    public Usuario(String nombreUsuario, String passwordUsuario, String nombreCompleto, String primerApellido, String segundoApellido, String correo, String descripcion, String genero, String foto, Date fechaNacimiento, Integer numeroReporte, Integer numeroLike, boolean admin) {
        this.nombreUsuario = nombreUsuario;
        this.passwordUsuario = passwordUsuario;
        this.nombreCompleto = nombreCompleto;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;        
        this.correo = correo;
        this.descripcion = descripcion;
        this.genero = genero;
        this.foto = foto;
        this.fechaNacimiento = fechaNacimiento;
        this.numeroReporte = numeroReporte;
        this.numeroLike = numeroLike;
        this.admin = admin;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public Integer getReputacion() {
        return reputacion;
    }

    public void setReputacion(Integer reputacion) {
        this.reputacion = reputacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getNumeroReporte() {
        return numeroReporte;
    }

    public void setNumeroReporte(Integer numeroReporte) {
        this.numeroReporte = numeroReporte;
    }

    public Integer getNumeroLike() {
        return numeroLike;
    }

    public void setNumeroLike(Integer numeroLike) {
        this.numeroLike = numeroLike;
    }

    public boolean getAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nombreUsuario != null ? nombreUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.nombreUsuario == null && other.nombreUsuario != null) || (this.nombreUsuario != null && !this.nombreUsuario.equals(other.nombreUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.daw.fipository.DTO.Usuario[ nombreUsuario=" + nombreUsuario + " ]";
    }

}
