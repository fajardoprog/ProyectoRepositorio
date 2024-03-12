/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.pojos;

import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.Usuario;

public class AuxiliarUsuarioRepositorio {
    private Repositorio repositorio;
    private Usuario usuario;

    public AuxiliarUsuarioRepositorio(Repositorio repositorio, Usuario usuario) {
        this.repositorio = repositorio;
        this.usuario = usuario;
    }    
    
    public Repositorio getRepositorio() {
        return repositorio;
    }

    public void setRepositorio(Repositorio repositorio) {
        this.repositorio = repositorio;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
}
