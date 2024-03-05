/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DAO.exceptions.NonexistentEntityException;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class CreacionRepositorio extends HttpServlet {

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
        String nombreRepositorio = request.getParameter("nombreRepositorio");
        String valorVisibilidadRepositorio = request.getParameter("visibilidad");
        String descripcionRepositorio= request.getParameter("descripcionRepositorio");
        int visibilidadRepositorio=0;
        boolean existente = false;
        Usuario u;
        Repositorio r;

        Cookie c = null;
        Cookie[] cs = request.getCookies();

        for (int i = 0; i < cs.length; i++) {
            if (cs[i].getName().equalsIgnoreCase("usuarioActual")) {
                c = cs[i];
            }
        }

        u = ctrUsu.findUsuario(c.getValue());

        File repositorios = new File(sc.getRealPath("/repositorios"));
        if (!repositorios.exists()) {
            repositorios.mkdir();
        }

        File raizUsuario = new File(sc.getRealPath("/repositorios/" + c.getValue()));
        if (!raizUsuario.exists()) {
            raizUsuario.mkdir();
        }

        File repositorioCreado = new File(sc.getRealPath("/repositorios/" + c.getValue() + "/" + nombreRepositorio));
        if (!repositorioCreado.exists()) {
            repositorioCreado.mkdir();
            RepositorioPK rPk = new RepositorioPK(c.getValue(), nombreRepositorio);
            
            if(valorVisibilidadRepositorio.equalsIgnoreCase("privado")){
                visibilidadRepositorio=1;
            }
            
            r = new Repositorio(rPk, descripcionRepositorio,visibilidadRepositorio , new Date());    
            
            try {
                ctrRepo.create(r);
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
