/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class productCart {
    private int quantityTB;
    private Product product;

    public productCart() {
    }

    public productCart(int quantityTB, Product product) {
        this.quantityTB = quantityTB;
        this.product = product;
    }

    public int getQuantityTB() {
        return quantityTB;
    }

    public void setQuantityTB(int quantityTB) {
        this.quantityTB = quantityTB;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    
    
}
