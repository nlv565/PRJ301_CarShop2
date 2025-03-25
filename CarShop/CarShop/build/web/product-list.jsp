<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, product.ProductDTO, category.CategoryDTO, category.CategoryDAO" %>
<%
    List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
    CategoryDAO categoryDAO = new CategoryDAO();
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Sản Phẩm</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .sidebar {
                height: 100vh;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #343a40;
                padding-top: 15px;
            }
            .sidebar a {
                padding: 12px 15px;
                text-decoration: none;
                font-size: 16px;
                color: #f8f9fa;
                display: block;
                transition: 0.3s;
            }
            .sidebar a:hover {
                background-color: #495057;
                text-decoration: none;
            }
            .content {
                margin-left: 260px;
                padding: 20px;
            }
            .table img {
                width: 50px;
                height: auto;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>

        <%@ include file="nav_bar.jsp" %> 
        <!-- Main Content -->
        <div class="content">
            <h2 class="mb-4">Quản Lý Sản Phẩm</h2>

            <a href="ProductManagement?action=add" class="btn btn-success mb-3">
                <i class="fas fa-plus"></i> Thêm Sản Phẩm
            </a>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Mô Tả</th>
                        <th>Giá (VNĐ)</th>
                        <th>Tồn Kho</th>
                        <th>Image</th>
                        <th>Danh Mục</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (productList != null && !productList.isEmpty()) { 
                        for (ProductDTO product : productList) { 
                            CategoryDTO category = categoryDAO.getCategoryById(product.getCategoryId()).orElse(null);
                    %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getInventory() %></td>
                        <td>
                            <img src="<%= product.getImageUrl() %>" alt="Product Image" style="width: 100px; height: auto;">
                        </td>
                        <td><%= category != null ? category.getName() : "Không xác định" %></td>
                        <td>
                            <a href="ProductManagement?action=edit&id=<%= product.getId() %>" class="btn btn-warning btn-sm">
                                <i class="fas fa-edit"></i> Sửa
                            </a>
                            <a href="ProductManagement?action=delete&id=<%= product.getId() %>" class="btn btn-danger btn-sm"
                               onclick="return confirm('Bạn có chắc muốn xóa không?')">
                                <i class="fas fa-trash"></i> Xóa
                            </a>
                        </td>
                    </tr>
                    <% } 
                } else { %>
                    <tr>
                        <td colspan="7" class="text-center">Không có sản phẩm nào.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>