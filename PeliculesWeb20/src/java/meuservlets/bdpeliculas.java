/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package meuservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import perbd.DBActionsNameBasics;
import perbd.DBActionsPeliculas;
import perbd.DBActionsPersonaPeli;
import perbd.DBActionsPoblaciones;
import perbd.DBActionsRatingPelis;
import perbd.DBActionsUsers;

/**
 *
 * @author mascport
 */
@WebServlet(name = "bdpeliculas", urlPatterns = {"/bdpeliculas"})
public class bdpeliculas extends HttpServlet {

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
        String res = gestionPeticion(request);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println(res);
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

    private String gestionPeticion(HttpServletRequest request) {
        String res = "";
        
        // Hemos tenido que poner el caracter encoding porque si no se jodian los resultados
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(bdpeliculas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String operacion = request.getParameter("op");
        String par = request.getParameter("par");
        System.out.println(par);
        String pais = request.getParameter("pais");
        switch (operacion) {
            case "todosporedad": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getTodosPorEdad(par);
                break;
            }
            case "edadactor": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getEdadActor(par);
                break;
            }
            case "cantidadporedad": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getCantidadPorEdad(par);
                break;
            }
            case "cantidadporfranja": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getCantidadPorFranja(par);
                break;
            }
            case "pelisporcadena": {
                DBActionsPeliculas dbap = new DBActionsPeliculas();
                res = dbap.getPelisPorCadena(par);
                break;
            }
            case "cantipelisporcadena": {
                DBActionsPeliculas dbap = new DBActionsPeliculas();
                res = dbap.getCantidPorCadena(par);
                break;
            }
            case "pelisdepersona": {
                DBActionsPersonaPeli dbapp = new DBActionsPersonaPeli();
                res = dbapp.getPelisDePersona(par);
                break;
            }
            case "personasdepeli": {
                DBActionsPersonaPeli dbapp = new DBActionsPersonaPeli();
                res = dbapp.getPersonasDePeli(par);
                break;
            }
            case "pelisderating": {
                DBActionsRatingPelis dbapp = new DBActionsRatingPelis();
                res = dbapp.getPelisDeRating(par);
                break;
            }
            case "gpspoblacion": {
                DBActionsPoblaciones dbap = new DBActionsPoblaciones();
                res = dbap.getGPSPoblacion(par, pais);
                break;
            }
            case "getuseraccess": {
                DBActionsUsers dbau = new DBActionsUsers();
                res = dbau.getUserAccess(par);
                break;
            }
            case "actorespais": {
                DBActionsPoblaciones dbap = new DBActionsPoblaciones();
                res = dbap.getActoresPais(par);
                break;
            }
            case "edadactorbienhecho": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getEdadActorInt(par);
                break;
            }
            case "actoresrandom": {
                DBActionsNameBasics dbanb = new DBActionsNameBasics();
                res = dbanb.getActoresRandom(par);
                break;
            }
            default:
                break;
        }
        return res;
    }
}
