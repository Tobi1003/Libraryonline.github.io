/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {

    private String orderID;
    private String userID;
    private Date getDate;
    private Date returnDate;
    private Float total;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, Date getDate, Date returnDate, Float total) {
        this.orderID = orderID;
        this.userID = userID;
        this.getDate = getDate;
        this.returnDate = returnDate;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate(Date getDate) {
        this.getDate = getDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

}
