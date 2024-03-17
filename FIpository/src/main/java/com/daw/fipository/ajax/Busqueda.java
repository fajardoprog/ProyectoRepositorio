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
import com.daw.fipository.DTO.Repositorio;
import com.daw.fipository.DTO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author José Antonio Fajardo Naranjo
 */
public class Busqueda extends HttpServlet {

    static JSONObject arrayObj, salida;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        HttpSession s = request.getSession();
        String tipoFiltro = request.getParameter("tipoFiltro");
        String filtro = request.getParameter("filtro");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fipositoryJPU");
        RepositorioJpaController ctrRepo = new RepositorioJpaController(emf);
        UsuarioJpaController ctrUsu = new UsuarioJpaController(emf);
        Usuario u = (Usuario) s.getAttribute("usuarioActual");
        salida = new JSONObject();
        if (tipoFiltro != null) {
            if (tipoFiltro.contains("usuario")) {
                List<Usuario> resultado = ctrUsu.usuariosFiltradosOrdenadosPorNombre(filtro);
                for (Usuario usu : resultado) {
                    String usuarioJson = new com.google.gson.Gson().toJson(usu);
                    salida.put(usu.getNombreUsuario(), usuarioJson);
                }
            } else {
                List<Repositorio>resultado = ctrRepo.repositoriosPorNombreOrdenados(filtro);
                
                for (Repositorio r : resultado) {
                    JSONObject repositorioJson = new JSONObject();
                    repositorioJson.put("nombrerepositorio", r.getRepositorioPK().getNombreUsuario()+"/"+r.getRepositorioPK().getNombreRepositorio());
                    repositorioJson.put("privado", r.getPrivado());
                    repositorioJson.put("numerovisitas", r.getNumeroVisitas());
                    repositorioJson.put("fechacreacion", r.getFechaCreacion());
                    repositorioJson.put("descripcion", r.getDescripcion());
                    salida.put(r.getRepositorioPK().getNombreRepositorio()+"/"+r.getRepositorioPK().getNombreUsuario(), repositorioJson);
                }
            }
        } else {
//            listaCarpetas = ctrArchivo.listaCarpetasUsuarioRepositorio(u.getNombreUsuario(), filtro);
//            for (Object carpeta : resultado) {
//                String carpetaJson = new com.google.gson.Gson().toJson(carpeta);
//                salida.put(carpeta.getArchivoPK().getNombreArchivo(), carpetaJson);
//            }
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
