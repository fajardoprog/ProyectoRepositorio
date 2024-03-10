/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@MultipartConfig
public class SubidaArchivos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = request.getSession().getServletContext();
        HttpSession s = request.getSession();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        RepositorioJpaController ctrRepo = new RepositorioJpaController(emf);
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        String repositorioSeleccionado = request.getParameter("elegirRepoFichero");
        String valorVisibilidadRepositorio = request.getParameter("visibilidad");
        String descripcionRepositorio = request.getParameter("descripcionRepositorio");
        int visibilidadRepositorio = 0;
        boolean existente = false;
        Usuario u;
        Repositorio r;
          //Se podria hacer en el doPost porque nunca se va a entrar por get
        String ruta = getServletContext().getRealPath("Files");
        Collection<Part> parts = request.getParts();
        if (parts == null) {
            System.out.println("No ha seleccionado un archivo");
        } else {
            for (Part part : parts) {
                // TODO: Hacer que se metan duplicados con el paréntesis: Ej: pedro.png (1), pedro.png (2),... pedro.png (n)
                String nombreFich = part.getSubmittedFileName();
                part.write(ruta + "\\" + nombreFich);
            }

        }
        response.sendRedirect("index.jsp");

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
