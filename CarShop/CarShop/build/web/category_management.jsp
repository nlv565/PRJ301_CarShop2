<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Category Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #343a40;
                padding-top: 15px;
            }
            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: #f8f9fa;
                display: block;
            }
            .sidebar a:hover {
                background-color: #495057;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <%@ include file="nav_bar.jsp" %> 


        <div class="container mt-5">
            <h2>Category Management</h2>

            <!-- Form thêm danh mục -->
            <form action="CategoryManagement" method="post">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label for="name">Category Name:</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="name">Category Icon:</label>
                    <input type="text" name="icon" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Category</button>
            </form>

            <hr>

            <!-- Danh sách danh mục -->
            <h3>Category List</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Icon</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (request.getAttribute("categories") != null) {
                    for (category.CategoryDTO category : (java.util.List<category.CategoryDTO>) request.getAttribute("categories")) { %>
                    <tr>
                        <td><%= category.getId() %></td>
                        <td><%= category.getName() %></td>
                        <td><img src="<%= category.getIcon() %>" alt="Category Icon" width="40" height="40" style="object-fit: contain;"></td>
                        <td>
                            <a href="CategoryManagement?action=edit&id=<%= category.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="CategoryManagement?action=delete&id=<%= category.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>