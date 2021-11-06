/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import sample.dtos.BookDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class BookDAO implements Serializable {

    public List<BookDTO> loadBook() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<BookDTO> result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookID, bookName, price, quantity, description FROM tblBook";
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String bookName = rs.getString("bookName");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    BookDTO dto = new BookDTO(bookID, bookName, price, quantity, description);
                    result.add(dto);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void updateBook(BookDTO dto) throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "UPDATE tblBook set bookName = ?, price = ?, quantity = ?, description = ? where bookID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, dto.getBookName());
                pst.setFloat(2, dto.getPrice());
                pst.setInt(3, dto.getQuantity());
                pst.setString(4, dto.getDescription());
                pst.setString(5, dto.getBookID());
                pst.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean deleteBook(String bookID) throws Exception {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "DELETE tblBook WHERE bookID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, bookID);
                int row = pst.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean checkID(String userID) throws Exception {

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select bookName FROM tblBook WHERE "
                        + " bookID = ?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, userID);;
                rs = pst.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public void insert(BookDTO dto) throws Exception {
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblBook(bookID, bookName, price, quantity, description) VALUES(?, ?, ?, ?, ?)";

                pst = conn.prepareStatement(sql);
                pst.setString(1, dto.getBookID());
                pst.setString(2, dto.getBookName());
                pst.setFloat(3, dto.getPrice());
                pst.setInt(4, dto.getQuantity());
                pst.setString(5, dto.getDescription());
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<BookDTO> getListUser(String search) throws SQLException, ClassNotFoundException, NamingException, Exception {
        List<BookDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT bookID, bookName, price, quantity, description  FROM tblBook WHERE bookName like '%" + search + "%'";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String bookName = rs.getString("bookName");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    list.add(new BookDTO(bookID, bookName, price, quantity, description));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public BookDTO getBook(String seach) throws Exception {
        BookDTO dto = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select bookID, bookName, price, quantity, description from tblBook where bookID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, seach);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String bookID = rs.getString("bookID");
                    String bookname = rs.getString("bookName");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    dto = new BookDTO(bookID, bookname, price, quantity, description);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dto;
    }
    
    public int checkQuantity(String bookID) throws Exception{
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int quantity = -1;
        try {
            con = DBUtils.getConnection();
            if (con != null){
                String sql = "select quantity from tblBook where bookID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, bookID);
                rs = pst.executeQuery();
                if (rs.next()){
                    quantity = rs.getInt("quantity");
                }
            }
        } finally {
            if (pst != null){
                pst.close();
            }
            if (con != null){
                con.close();
            }
        }
        return quantity;
    }
    
    public boolean updateQuantity(int quantity, String bookID) throws Exception{
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBUtils.getConnection();
            if (con != null){
                String sql = "update tblBook set quantity = ? where bookID = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, quantity);
                pst.setString(2, bookID);
                int row = pst.executeUpdate();
                if (row > 0){
                    return true;
                }
            }
        } finally {
            if (pst != null){
                pst.close();
            }
            if (con != null){
                con.close();
            }
        }
        return false;
    }
}
