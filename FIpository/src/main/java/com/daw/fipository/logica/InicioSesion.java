/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Usuario;
import java.io.IOException;
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
public class InicioSesion extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        HttpSession s = request.getSession();
        String nombre = request.getParameter("nombreUsuario");
        String password = request.getParameter("passwordUsu");
        Usuario u = ctrUsu.findUsuario(nombre);
        if (u != null) {
            if (u.getPasswordUsuario().equalsIgnoreCase(password)) {
                s.setAttribute("usuarioActual", u);
                s.setAttribute("invitado", false);
                if (u.getAdmin()) {
                    response.sendRedirect("AdminIndex.jsp");
                } else {
                    response.sendRedirect("miEspacio.jsp");
                }
            } else {
                response.sendRedirect("inicioSesion.jsp");
            }
        } else {
            response.sendRedirect("inicioSesion.jsp");
        }

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
