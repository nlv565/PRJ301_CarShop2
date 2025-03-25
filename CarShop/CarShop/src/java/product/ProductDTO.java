/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package product;

import java.time.LocalDateTime;
import java.util.Locale.Category;

/**
 *
 * @author ADMIN-PC
 */
public class ProductDTO {

    private int id;
    private String name;
    private String description;
    private double price;
    private double discountPercent;
    private LocalDateTime expiration;
    private int categoryId;
    private LocalDateTime createdAt;
    private int inventory;
    private String imageUrl;
    private boolean isActive;
    private String yearManufactured;
    private String fuelType;
    private String transmission;

    public ProductDTO() {
    }

    public ProductDTO(int id, String name, String description, double price, double discountPercent, LocalDateTime expiration, int categoryId, LocalDateTime createdAt, int inventory, String imageUrl, boolean isActive) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.discountPercent = discountPercent;
        this.expiration = expiration;
        this.categoryId = categoryId;
        this.createdAt = createdAt;
        this.inventory = inventory;
        this.imageUrl = imageUrl;
        this.isActive = isActive;
    }

    public ProductDTO(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public ProductDTO(int id, String name, String description, double price, double discountPercent, LocalDateTime expiration, int categoryId, LocalDateTime createdAt, int inventory, String imageUrl, boolean isActive, String yearManufactured, String fuelType, String transmission) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.discountPercent = discountPercent;
        this.expiration = expiration;
        this.categoryId = categoryId;
        this.createdAt = createdAt;
        this.inventory = inventory;
        this.imageUrl = imageUrl;
        this.isActive = isActive;
        this.yearManufactured = yearManufactured;
        this.fuelType = fuelType;
        this.transmission = transmission;
    }

    public ProductDTO(int id, String name, String description, double price, double discountPercent, LocalDateTime expiration, int categoryId, LocalDateTime createdAt, int inventory, String imageUrl, boolean isActive, String yearManufactured, String fuelType, String transmission, Category category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.discountPercent = discountPercent;
        this.expiration = expiration;
        this.categoryId = categoryId;
        this.createdAt = createdAt;
        this.inventory = inventory;
        this.imageUrl = imageUrl;
        this.isActive = isActive;
        this.yearManufactured = yearManufactured;
        this.fuelType = fuelType;
        this.transmission = transmission;
    }

    public String getYearManufactured() {
        return yearManufactured;
    }

    public void setYearManufactured(String yearManufactured) {
        this.yearManufactured = yearManufactured;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public LocalDateTime getExpiration() {
        return expiration;
    }

    public void setExpiration(LocalDateTime expiration) {
        this.expiration = expiration;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

}
