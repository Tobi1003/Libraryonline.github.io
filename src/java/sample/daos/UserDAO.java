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
import javax.naming.NamingException;
import sample.dtos.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO implements Serializable {
    public String checkLogin(String userID, String password) throws Exception {
        String role = "failed";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select roleID From tblUsers Where userID = ? and password = ?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    role = rs.getString("roleID");
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
        return role;
    }
    
    public UserDTO checkLogin2(String userID, String password)
            throws SQLException, ClassNotFoundException, NamingException, Exception {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        UserDTO dto = null;
        String fullname = "";
        String roleID = "";
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT fullname, roleID FROM tblUsers WHERE userID =? and password =?";
                pst = con.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    fullname = rs.getString("fullname");
                    roleID = rs.getString("roleID");
                    dto = new UserDTO(userID, fullname, password, roleID);
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
        return dto;
    }
}
