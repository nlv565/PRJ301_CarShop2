<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="order.OrderDetailWithOrderDTO"%>
<%@page import="order.OrderItemDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết đơn hàng</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .product-image {
                max-width: 100px;
                max-height: 100px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0">Chi tiết đơn hàng</h2>
                </div>
                <%
                    OrderDetailWithOrderDTO orderDetails = (OrderDetailWithOrderDTO) request.getAttribute("orderDetails");
                    if (orderDetails != null) {
                %>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="h4 mb-3">Thông tin đơn hàng</h3>
                            <dl class="row">
                                <dt class="col-sm-4">Mã đơn hàng:</dt>
                                <dd class="col-sm-8"><%= orderDetails.getOrderId() %></dd>

                                <dt class="col-sm-4">Tổng tiền:</dt>
                                <dd class="col-sm-8"><%= orderDetails.getOrderAmount() %> VNĐ</dd>

                                <dt class="col-sm-4">Địa chỉ giao hàng:</dt>
                                <dd class="col-sm-8"><%= orderDetails.getAddress() %></dd>

                                <dt class="col-sm-4">Ghi chú:</dt>
                                <dd class="col-sm-8"><%= orderDetails.getNote() %></dd>

                                <dt class="col-sm-4">Ngày tạo:</dt>
                                <dd class="col-sm-8"><%= orderDetails.getCreatedAt() %></dd>
                            </dl>
                        </div>
                    </div>

                    <h3 class="h4 mb-3">Sản phẩm trong đơn hàng</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<OrderItemDTO> orderItems = orderDetails.getOrderItems();
                                    if (orderItems != null && !orderItems.isEmpty()) {
                                        for (OrderItemDTO item : orderItems) {
                                %>
                                <tr>
                                    <td>
                                        <img src="<%= item.getProductImage() %>" 
                                             alt="<%= item.getProductName() %>" 
                                             class="img-thumbnail product-image">
                                    </td>
                                    <td><%= item.getProductName() %></td>
                                    <td><%= item.getQuantity() %></td>
                                    <td><%= item.getPrice() %> VNĐ</td>
                                    <td><%= item.getQuantity() * item.getPrice() %> VNĐ</td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="5" class="text-center text-muted">Không có sản phẩm nào trong đơn hàng.</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    } else {
                %>
                <div class="card-body">
                    <div class="alert alert-warning" role="alert">
                        Không tìm thấy đơn hàng.
                    </div>
                </div>
                <%
                    }
                %>
                <div class="card-footer">
                    <a href="OrderManagement" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Quay lại quản lý đơn hàng
                    </a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies (optional) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>