/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Product {
    private String ProductID;
    private float Price;
    private int Quantity;
    private String ProName;
    private String ProImage;
    private String Describe;
    private String TypeName;

    public Product() {
    }

    public Product(String ProductID, float Price, int Quantity, String ProName, String ProImage, String Describe, String TypeName) {
        this.ProductID = ProductID;
        this.Price = Price;
        this.Quantity = Quantity;
        this.ProName = ProName;
        this.ProImage = ProImage;
        this.Describe = Describe;
        this.TypeName = TypeName;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getProName() {
        return ProName;
    }

    public void setProName(String ProName) {
        this.ProName = ProName;
    }

    public String getProImage() {
        return ProImage;
    }

    public void setProImage(String ProImage) {
        this.ProImage = ProImage;
    }

    public String getDescribe() {
        return Describe;
    }

    public void setDescribe(String Describe) {
        this.Describe = Describe;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String TypeName) {
        this.TypeName = TypeName;
    }
    
    
}
