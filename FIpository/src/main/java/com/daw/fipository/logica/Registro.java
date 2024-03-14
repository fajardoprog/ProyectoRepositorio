/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Usuario;
import java.io.File;
/*import java.util.Date;*/
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
@MultipartConfig
public class Registro extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = request.getSession().getServletContext();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        HttpSession s = request.getSession();
        String nombre = request.getParameter("nombreUsuario");
        String password = request.getParameter("passwordUsuario");
        String nombreCompleto = request.getParameter("nombreCompleto");
        String primerApellidoUsuario = request.getParameter("primerApellidoUsuario");
        String segundoApellidoUsuario = request.getParameter("segundoApellidoUsuario");
        String correoUsuario = request.getParameter("correoUsuario");
        String fechaNacimientoUsuario = request.getParameter("fechaNacimientoUsuario");
        String generoUsuario = request.getParameter("generoUsuario");
        String otroGenero = request.getParameter("otroGenero");
        String descripcionUsu = request.getParameter("descripcionUsu");

        //Date fechaNacimiento = new Date(fechaNacimientoUsuario);
        Date fechaNacimiento = Date.valueOf(fechaNacimientoUsuario);
        if (generoUsuario.equalsIgnoreCase("Otro")) {
            generoUsuario = otroGenero;
        }

        File repositorios = new File(sc.getRealPath("/imgPerfilUsuario"));
        if (!repositorios.exists()) {
            repositorios.mkdir();
        }

        final String[] extens = {".png", ".jpg", ".jpeg"};

        String rutaImg = getServletContext().getRealPath("imgPerfilUsuario");
        Part part = request.getPart("fotoUsu");
        String nombreFich = "";

        if (part == null) {
            request.setAttribute("mensajeError", "Error no se ha podido subir la foto");
        } else {
            if (isExtension(part.getSubmittedFileName(), extens)) {

                nombreFich = part.getSubmittedFileName();

                part.getInputStream();

                part.write(rutaImg + "\\" + nombreFich);
            }

        }

        //String nombreUsuario, String passwordUsuario, String nombreCompleto, String primerApellido, String segundoApellido, String correo, String descripcion, String genero, String foto, Date fechaNacimiento, Integer numeroReporte, Integer numeroLike, boolean admin
        Usuario u = new Usuario(nombre, password, nombreCompleto, primerApellidoUsuario, segundoApellidoUsuario, correoUsuario, descripcionUsu, generoUsuario, nombreFich, fechaNacimiento,0,0,false);
        u.setReputacion(0);
        try {
            ctrUsu.create(u);
        } catch (Exception ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }

        s.setAttribute("usuarioActual", u);
        s.setAttribute("invitado", false);
        response.sendRedirect("miEspacio.jsp");

    }

    private boolean isExtension(String fileName, String[] extensions) {
        for (String et : extensions) {
            if (fileName.toLowerCase().endsWith(et)) {
                return true;
            }
        }

        return false;
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
