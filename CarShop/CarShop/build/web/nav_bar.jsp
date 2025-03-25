<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
    /* Sidebar Styles */
    .sidebar {
        height: 100vh;
        width: 260px;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #212529;
        padding-top: 20px;
        display: flex;
        flex-direction: column;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
    }

    /* Sidebar Links */
    .sidebar a {
        padding: 14px 20px;
        font-size: 16px;
        color: #f8f9fa;
        text-decoration: none;
        display: flex;
        align-items: center;
        transition: all 0.3s ease-in-out;
        border-radius: 6px;
        margin: 5px 10px;
    }

    .sidebar a i {
        margin-right: 12px;
    }

    .sidebar a:hover {
        background-color: #495057;
        transform: scale(1.05);
    }

    /* Logout Button */
    .sidebar .logout {
        margin-top: auto;
        padding: 15px;
        text-align: center;
    }

    .sidebar .logout a {
        color: #dc3545;
        font-weight: bold;
        padding: 10px 15px;
        display: inline-block;
        width: 100%;
        border-radius: 6px;
    }

    .sidebar .logout a:hover {
        background-color: #bd2130;
        color: #fff;
    }
</style>

<div class="sidebar d-flex flex-column">
    <a href="ProductManagement"><i class="fas fa-boxes"></i> Product Management</a>
    <a href="OrderManagement"><i class="fas fa-shopping-cart"></i> Order Management</a>
    <a href="UserManagement"><i class="fas fa-users"></i> User Management</a>
    <a href="CategoryManagement"><i class="fas fa-list"></i> Category Management</a>
    <div class="logout">
        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>