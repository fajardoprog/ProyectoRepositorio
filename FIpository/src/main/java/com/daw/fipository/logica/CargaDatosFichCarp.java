package com.daw.fipository.logica;

import com.daw.fipository.DAO.RepositorioJpaController;
import com.daw.fipository.DAO.UsuarioJpaController;
import com.daw.fipository.DTO.Usuario;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
public class CargaDatosFichCarp extends HttpServlet {

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
        Cookie c = null;
        Cookie[] cs = request.getCookies();
        ArrayList<String> listaDirectorios = new ArrayList<>();

        for (int i = 0; i < cs.length; i++) {
            if (cs[i].getName().equalsIgnoreCase("usuarioActual")) {
                c = cs[i];
            }
        }

        Usuario u = ctrUsu.findUsuario(c.getValue());
        File raizUsuario = new File(sc.getRealPath("/repositorios/" + c.getValue()));
        if (raizUsuario.exists()) {
            File[] listaDirectoriosTotal = raizUsuario.listFiles();
            for (int i = 0; i < listaDirectoriosTotal.length; i++) {
                if (listaDirectoriosTotal[i].isDirectory()){
                    listaDirectorios.add(listaDirectoriosTotal[i].getName());
                }
            }
        }
        
        request.setAttribute("listaDirectorios", listaDirectorios);
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
