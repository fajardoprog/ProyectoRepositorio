/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.ColaboradoresJpaController;
import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Colaboradores;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.RepositorioPK;
import com.daw.fipository.DTO.Usuario;
import com.daw.fipository.pojos.AuxiliarUsuarioRepositorio;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class CargaDatosRepositorio extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        
        RepositorioJpaController ctrRepo = new RepositorioJpaController(emf);
        ColaboradoresJpaController ctrColab = new ColaboradoresJpaController(emf);
        
        HttpSession s = request.getSession();
        Usuario u = (Usuario) s.getAttribute("usuarioActual");
        List<Repositorio> listaRepositorios = ctrRepo.listaCarpetasUsuarioRepositorio(u.getNombreUsuario());
        request.setAttribute("misRepositorios", listaRepositorios);
        List<Colaboradores> repositariosColaborados = ctrColab.listaRepositoriosColaboradores(u.getNombreUsuario());
        ArrayList<AuxiliarUsuarioRepositorio> listaRepositoriosCompartidos = new ArrayList();
        for (Colaboradores rC : repositariosColaborados) {
            RepositorioPK rPk = new RepositorioPK(rC.getColaboradoresPK().getNombreUsuarioColaborado(), rC.getColaboradoresPK().getNombreRepositorioColaborado());
            listaRepositoriosCompartidos.add(new AuxiliarUsuarioRepositorio(ctrRepo.findRepositorio(rPk), u));
        }
        request.setAttribute("repositoriosCompartidos", listaRepositoriosCompartidos);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
