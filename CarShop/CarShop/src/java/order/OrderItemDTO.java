package order;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ADMIN-PC
 */
public class OrderItemDTO {
    private int quantity;
    private double price;
    private String productName;
    private String productImage;

    public OrderItemDTO(int quantity, double price, String productName, String productImage) {
        this.quantity = quantity;
        this.price = price;
        this.productName = productName;
        this.productImage = productImage;
    }

    // Getters & Setters
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }
}
