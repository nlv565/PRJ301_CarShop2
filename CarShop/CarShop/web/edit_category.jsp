<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Edit Category</h2>

            <form action="CategoryManagement" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= request.getAttribute("category") != null ? ((category.CategoryDTO) request.getAttribute("category")).getId() : "" %>">
                <div class="form-group">
                    <label for="name">Category Name:</label>
                    <input type="text" name="name" class="form-control" required value="<%= request.getAttribute("category") != null ? ((category.CategoryDTO) request.getAttribute("category")).getName() : "" %>">
                </div>
                <div class="form-group">
                    <label for="name">Category Icon:</label>
                    <input type="text" name="icon" class="form-control" required value="<%= request.getAttribute("category") != null ? ((category.CategoryDTO) request.getAttribute("category")).getIcon() : "" %>">
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="CategoryManagement" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>