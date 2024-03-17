/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.ArchivoJpaController;
import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Archivo;
import com.daw.fipository.DTO.ArchivoPK;
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.RepositorioPK;
import com.daw.fipository.DTO.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
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
        request.setCharacterEncoding("UTF-8");
        ServletContext sc = request.getSession().getServletContext();
        HttpSession s = request.getSession();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        RepositorioJpaController ctrRepo = new RepositorioJpaController(emf);
        ArchivoJpaController ctrArch = new ArchivoJpaController(emf);
        String repositorioSeleccionado = request.getParameter("elegirRepoFichero");
        String carpetaElegida = request.getParameter("carpetaElegida");
        Usuario u;
        Repositorio r;
        u = (Usuario) s.getAttribute("usuarioActual");
        String ruta = getServletContext().getRealPath("repositorios/" + u.getNombreUsuario() + "/" + repositorioSeleccionado + "/" + carpetaElegida);
        Collection<Part> parts = request.getParts();
        if (parts == null) {
            System.out.println("No ha seleccionado un archivo");
        } else {
            for (Part part : parts) {
                String nombreFich = part.getSubmittedFileName();
                if (nombreFich != null) {
                    File archivoFile = new File(sc.getRealPath("/repositorios/" + u.getNombreUsuario() + "/" + repositorioSeleccionado + "/" + carpetaElegida + "/" + nombreFich));
                    part.write(ruta + "/" + nombreFich);
                    ArchivoPK aPK = new ArchivoPK(carpetaElegida + "/" + nombreFich, u.getNombreUsuario(), repositorioSeleccionado);
                    //ArchivoPK archivoPK, Date fechaCreacion, boolean carpeta, Integer numArchivos, BigDecimal peso, String color
                    Archivo a = new Archivo(aPK, new Date(), false, archivoFile.length());
                    Archivo carpetaContenedora =  ctrArch.findArchivo(new ArchivoPK(carpetaElegida, u.getNombreUsuario(), repositorioSeleccionado));
                    carpetaContenedora.setNumArchivos(carpetaContenedora.getNumArchivos()+1); 
                    try {
                        ctrArch.create(a);
                    } catch (Exception ex) {
                        Logger.getLogger(SubidaArchivos.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

            }
        }
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
