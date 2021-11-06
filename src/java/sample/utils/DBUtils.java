/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Random;

/**
 *
 * @author ADMIN
 */
public class DBUtils implements Serializable {

    public static Connection getConnection() throws Exception {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=LibraryOnline";
        conn = DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
    
    private static final String DIGITS = "0123456789"; // 0-9

    private static Random generator = new Random();

    public static int randomNumber(int min, int max) {
        return generator.nextInt((max - min) + 1) + min;
    }

    public static String randomAlphaNumeric(int numberOfCharactor) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(0, DIGITS.length() - 1);
            char ch = DIGITS.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }
}
