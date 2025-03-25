/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package order;

import java.time.LocalDateTime;
import java.util.List;

public class OrderDetailWithOrderDTO {
    private int orderId;
    private double orderAmount;
    private String address;
    private String note;
    private LocalDateTime createdAt;
    private List<OrderItemDTO> orderItems;

    public OrderDetailWithOrderDTO(int orderId, double orderAmount, String address, String note, LocalDateTime createdAt, List<OrderItemDTO> orderItems) {
        this.orderId = orderId;
        this.orderAmount = orderAmount;
        this.address = address;
        this.note = note;
        this.createdAt = createdAt;
        this.orderItems = orderItems;
    }

    // Getters & Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public double getOrderAmount() { return orderAmount; }
    public void setOrderAmount(double orderAmount) { this.orderAmount = orderAmount; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public List<OrderItemDTO> getOrderItems() { return orderItems; }
    public void setOrderItems(List<OrderItemDTO> orderItems) { this.orderItems = orderItems; }
}

