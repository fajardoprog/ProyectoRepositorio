/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.ajax;

import com.daw.fipository.DAO.ArchivoJpaController;
import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Archivo;
import com.daw.fipository.DTO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class RecuperarCarpetas extends HttpServlet {

    static JSONObject arrayObj, salida;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String repositorio = request.getParameter("repositorio");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        ArchivoJpaController ctrArchivo = new ArchivoJpaController(emf);

        Cookie c = null;
        Cookie[] cs = request.getCookies();
        for (int i = 0; i < cs.length; i++) {
            if (cs[i].getName().equalsIgnoreCase("usuarioActual")) {
                c = cs[i];
            }
        }
        Usuario u = ctrUsu.findUsuario(c.getValue());
        
        List<Archivo> listaCarpetas = ctrArchivo.listaCarpetasUsuarioRepositorio(u.getNombreUsuario(), repositorio);
        salida = new JSONObject();
        for (Archivo carpeta : listaCarpetas) {
            String carpetaJson = new com.google.gson.Gson().toJson(carpeta);  
            salida.put(carpeta.getArchivoPK().getNombreArchivo(), carpetaJson);
        }
        
        out.println(salida);

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
        doPost(request, response);
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
