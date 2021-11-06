/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "invalid.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String LOADBOOK = "LoadBookController";
    private static final String UPDATE_PAGE = "updatebook.jsp";
    private static final String UPDATE = "UpdateBookController";
    private static final String DELETE = "DeleteBookController";
    private static final String ADD_BOOK = "addBook.jsp";
    private static final String CREATE_BOOK = "CreateBookController";
    private static final String SEARCH_BOOK = "SearchBookController";
    private static final String ADD = "AddController";
    private static final String VIEW = "view.jsp";
    private static final String DELETE_BOOK = "DeleteBookCartController";
    private static final String UPDATE_BOOK = "UpdateBookCartController";
    private static final String CHECKOUT = "CheckoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Book Manage")) {
                url = LOADBOOK;
            } else if (action.equals("Update Book")) {
                url = UPDATE_PAGE;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Add New Book")) {
                url = ADD_BOOK;
            } else if (action.equals("Create")) {
                url = CREATE_BOOK;
            } else if (action.equals("Search Book")) {
                url = SEARCH_BOOK;
            } else if (action.equals("Add To Cart")) {
                url = ADD;
            } else if (action.equals("View")) {
                url = VIEW;
            } else if (action.equals("Delete Book")) {
                url = DELETE_BOOK;
            } else if (action.equals("Update Book Cart")) {
                url = UPDATE_BOOK;
            } else if (action.equals("Checkout")) {
                url = CHECKOUT;
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
