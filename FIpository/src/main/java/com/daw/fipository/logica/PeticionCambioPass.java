/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.AccionsobreusuarioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Accionsobreusuario;
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
 * @author IsmaelJJL
 */
public class PeticionCambioPass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        UsuarioJpaController ctrUsuario = new UsuarioJpaController(emf);
        AccionsobreusuarioJpaController ctrAccionSobbreUsu = new AccionsobreusuarioJpaController(emf);
        HttpSession s = request.getSession();

        String nomreUsu = request.getParameter("nombreUsuario");

        Usuario usuActual = ctrUsuario.findUsuario(nomreUsu);

        if (usuActual != null) {
            Accionsobreusuario AcUsu = new Accionsobreusuario(null, usuActual.getNombreUsuario(), "Cambio Password");
            ctrAccionSobbreUsu.create(AcUsu);
            response.sendRedirect("agradecimiento.jsp");
        } else {
            s.setAttribute("error", "El usuario introducido no existe");
            response.sendRedirect("recuperaPass.jsp");
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
