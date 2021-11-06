/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

/**
 *
 * @author ADMIN
 */
public class UpdateErrorDTO {
    private String bookNameError;
    private String priceError;
    private String quantityError;
    private String descriptionError;

    public UpdateErrorDTO() {
    }

    public UpdateErrorDTO(String bookNameError, String priceError, String quantityError, String descriptionError) {
        this.bookNameError = bookNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.descriptionError = descriptionError;
    }

    public String getBookNameError() {
        return bookNameError;
    }

    public void setBookNameError(String bookNameError) {
        this.bookNameError = bookNameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }
    
    
}
