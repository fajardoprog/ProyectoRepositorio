/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.ArchivoJpaController;
import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
import com.daw.fipository.DTO.Archivo;
import com.daw.fipository.DTO.ArchivoPK;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.RepositorioPK;
import com.daw.fipository.DTO.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@MultipartConfig
public class SubidaCarpetas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = request.getSession().getServletContext();
        HttpSession s = request.getSession();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        ArchivoJpaController ctrArch = new ArchivoJpaController(emf);
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        String nombreRepositorio = request.getParameter("elegirRepoCarpeta");
        String nombreCarpeta = request.getParameter("nombreCarpeta");
        String colorCarpeta = request.getParameter("colorCarpeta");
        boolean existente = false;
        Usuario u;

        u = (Usuario) s.getAttribute("usuarioActual");

        File carpetaCreado = new File(sc.getRealPath("/repositorios/" + u.getNombreUsuario() + "/" + nombreRepositorio + "/" + nombreCarpeta));
        if (!carpetaCreado.exists()) {
            carpetaCreado.mkdir();
            ArchivoPK aPK = new ArchivoPK(nombreCarpeta, u.getNombreUsuario(), nombreRepositorio);
            Archivo a = new Archivo(aPK, new Date(), true, 0, colorCarpeta);
            System.out.println(a);
            try {
                ctrArch.create(a);
            } catch (Exception ex) {
                System.err.println(ex.getCause());
            }
            try {
                ctrUsu.edit(u);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(CreacionRepositorio.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(CreacionRepositorio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            existente = true;
        }

        request.setAttribute("repositorioExistente", existente);
        response.sendRedirect("subida.jsp");

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
