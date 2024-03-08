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
    private String productID;
    private float price;
    private int quantity;
    private String proName;
    private String proImage;
    private String describe;
    private String typeName;

    public Product() {
    }

    public Product(String ProductID, float Price, int Quantity, String ProName, String ProImage, String Describe, String TypeName) {
        this.productID = ProductID;
        this.price = Price;
        this.quantity = Quantity;
        this.proName = ProName;
        this.proImage = ProImage;
        this.describe = Describe;
        this.typeName = TypeName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String ProductID) {
        this.productID = ProductID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float Price) {
        this.price = Price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int Quantity) {
        this.quantity = Quantity;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String ProName) {
        this.proName = ProName;
    }

    public String getProImage() {
        return proImage;
    }

    public void setProImage(String ProImage) {
        this.proImage = ProImage;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String Describe) {
        this.describe = Describe;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String TypeName) {
        this.typeName = TypeName;
    }
    
    
}
