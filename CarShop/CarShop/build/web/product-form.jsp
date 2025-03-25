<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="product.ProductDTO" %>
<%@ page import="category.CategoryDTO" %>
<%@ page import="category.CategoryDAO" %>
<%
    ProductDTO product = (ProductDTO) request.getAttribute("product");
    CategoryDAO categoryDAO = new CategoryDAO();
    boolean isEdit = product != null;
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title><%= isEdit ? "Chỉnh Sửa" : "Thêm" %> Sản Phẩm</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">

        <div class="container mt-5">
            <div class="card shadow p-4">
                <h2 class="mb-4 text-center"><%= isEdit ? "Chỉnh Sửa" : "Thêm" %> Sản Phẩm</h2>

                <form action="ProductManagement?action=<%= isEdit ? "update" : "insert" %>" method="post">
                    <% if (isEdit) { %>
                    <input type="hidden" name="id" value="<%= product.getId() %>">
                    <% } %>

                    <!-- Tên sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" name="name" class="form-control" value="<%= isEdit ? product.getName() : "" %>" required>
                    </div>

                    <!-- Mô tả sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="description" class="form-control" rows="3"><%= isEdit ? product.getDescription() : "" %></textarea>
                    </div>

                    <!-- Giá sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Giá</label>
                        <input type="number" name="price" class="form-control" value="<%= isEdit ? product.getPrice() : "" %>" required>
                    </div>

                    <!-- Số lượng tồn kho -->
                    <div class="mb-3">
                        <label class="form-label">Tồn kho</label>
                        <input type="number" name="inventory" class="form-control" value="<%= isEdit ? product.getInventory() : "" %>" required>
                    </div>

                    <!-- Ảnh sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Ảnh sản phẩm (URL)</label>
                        <input type="text" name="image" class="form-control" value="<%= isEdit ? product.getImageUrl() : "" %>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Năm sản xuất</label>
                        <input type="number" id="yearManufactured" name="yearManufactured" class="form-control"
                               value="<%= isEdit ? product.getYearManufactured() : "" %>" min="1900">
                        <small id="yearError" class="text-danger"></small>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Loại nhiên liệu</label>
                        <select name="fuelType" class="form-control">
                            <option value="Điện" <%= isEdit && product.getFuelType().equals("Điện") ? "selected" : "" %>>Điện</option>
                            <option value="Xăng" <%= isEdit && product.getFuelType().equals("Xăng") ? "selected" : "" %>>Xăng</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Hộp số</label>
                        <select name="transmission" class="form-control">
                            <option value="Số sàn" <%= isEdit && product.getTransmission().equals("Số sàn") ? "selected" : "" %>>Số sàn</option>
                            <option value="Số tự động" <%= isEdit && product.getTransmission().equals("Số tự động") ? "selected" : "" %>>Số tự động</option>
                        </select>
                    </div>


                    <!-- Danh mục sản phẩm -->
                    <div class="mb-3">
                        <label class="form-label">Danh mục</label>
                        <select name="categoryId" class="form-select" required>
                            <% for (CategoryDTO category : categoryDAO.getAllCategories()) { %>
                            <option value="<%= category.getId() %>" 
                                    <%= isEdit && product.getCategoryId() == category.getId() ? "selected" : "" %>>
                                <%= category.getName() %>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <!-- Hoạt động -->
                    <div class="form-check mb-3">
                        <input type="checkbox" name="isActive" class="form-check-input" id="isActive" <%= isEdit && product.isIsActive() ? "checked" : "" %>>
                        <label class="form-check-label" for="isActive">Sản phẩm đang hoạt động</label>
                    </div>

                    <!-- Nút submit -->
                    <button type="submit" class="btn btn-primary w-100">
                        <%= isEdit ? "Cập Nhật" : "Thêm Mới" %>
                    </button>
                </form>
            </div>
        </div>
        <script>
            document.getElementById('yearManufactured').addEventListener('input', function () {
                let inputYear = parseInt(this.value);
                let currentYear = new Date().getFullYear();
                let errorMessage = "";

                if (isNaN(inputYear) || inputYear <= 0) {
                    errorMessage = "Năm sản xuất phải lớn hơn 0.";
                } else if (inputYear > currentYear) {
                    errorMessage = "Năm sản xuất không được lớn hơn năm hiện tại.";
                }

                document.getElementById('yearError').innerText = errorMessage;
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>