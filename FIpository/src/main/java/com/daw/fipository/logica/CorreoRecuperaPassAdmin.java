/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daw.fipository.logica;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IsmaelJJL
 */
public class CorreoRecuperaPassAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String estadoMensaje = "";

        String receptorM = request.getParameter("EmailUsu");/*Correo del usuario que enviara el mensaje con el nuevo codigo*/
        
        String asuntoM = "Cambio de contraseña"; //Asunto Fijo ya que smp tratara este tema 
        
        System.out.println("Entra al servlet");
        
        String argumentoM = request.getParameter("argumentoAdmin");/*Lo que enviara el admin*/

        // Receptor del mensaje.
        String to = receptorM;

        // Emisor del correo
        String from = "fipository@gmail.com";

        // host del servidor smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Obtenemos el objeto sesion la contraseña usuario
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("fipository@gmail.com", "taxlpfoujdgwqmwv");/*Camiar codigo si no envia el correo o no se recibe*/
            }
        });

        try {
            // Crear un default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Emisor
            message.setFrom(new InternetAddress(from));

            // Receptor
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Setear Asunto
            message.setSubject(asuntoM);

            // Setear el argumento de mensaje
            message.setText(argumentoM);

            // Enviar el mensaje
            Transport.send(message);
            estadoMensaje = "Mensaje enviado correctamente....";
            
            System.out.println("Entra al try");

        } catch (MessagingException mex) {
            estadoMensaje = "Error enviando el mensaje";
            mex.printStackTrace();
        }

        request.setAttribute("MensajeEmail", estadoMensaje);
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
