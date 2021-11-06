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
import sample.daos.BookDAO;
import sample.dtos.BookDTO;
import sample.dtos.BookErrorDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class CreateBookController extends HttpServlet {

    private static final String SUCCESS = "LoadBookController";
    private static final String ERROR = "addBook.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookID = request.getParameter("txtBookID");
            String bookName = request.getParameter("txtBookName");
            String price = request.getParameter("txtPrice");
            String quantity = request.getParameter("txtQuantity");
            String description = request.getParameter("txtDescription");

            boolean check = true;
            BookErrorDTO errorDTO = new BookErrorDTO();
            if (bookID.isEmpty()) {
                errorDTO.setBookIDError("Book ID must not be Empty");
                check = false;
            }
            if (bookName.isEmpty() || bookName.length() < 3 || bookName.length() > 15) {
                errorDTO.setBookNameError("Name to be greater than 3 characters but less than 15");
                check = false;
            }
            if(price.isEmpty() || Float.parseFloat(price) < 0){
                errorDTO.setPriceError("Price must not be empty or < 0");
                check = false;
            }
            if (quantity.isEmpty() || Integer.parseInt(quantity) < 0) {
                errorDTO.setQuantityError("Quantity must not be empty or quantity < 0");
                check = false;
            }
            
            if (description.isEmpty()) {
                errorDTO.setDescriptionError("Description must not be empty");
                check = false;
            }

            BookDAO dao = new BookDAO();

            if (dao.checkID(bookID)) {
                errorDTO.setBookIDError("ID Is Existed!");
                check = false;
            }
            if (check) {
                BookDTO dto = new BookDTO(bookID, bookName, Float.parseFloat(price), Integer.parseInt(quantity), description);
                dao.insert(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", errorDTO);
            }

        } catch (Exception e) {
            log("Error at CreateBookController: " + e.toString());
            
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
