package order;

import java.time.LocalDateTime;

public class OrderDTO {

    private int id;
    private LocalDateTime createdAt;
    private double amount;
    private String address;
    private String note;
    private int userId;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(int id, LocalDateTime createdAt, double amount, String address, String note, int userId, String status) {
        this.id = id;
        this.createdAt = createdAt;
        this.amount = amount;
        this.address = address;
        this.note = note;
        this.userId = userId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
}
