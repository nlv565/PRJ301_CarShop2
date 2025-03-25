<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Orders</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            /* Custom styles for sidebar and content */
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

        <!-- Sidebar -->
        <%@ include file="nav_bar.jsp" %> 
        <!-- Page content -->
        <div class="content">
            <h2>Manage Orders</h2>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Address</th>
                        <th>Note</th>
                        <th>User ID</th>
                        <th>Status</th>
                        <th>Action</th>  
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through orders -->
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.createdAt}</td>
                            <td>${order.amount}</td>
                            <td>${order.address}</td>
                            <td>${order.note}</td>
                            <td>${order.userId}</td>
                            <td>
                                <form action="UpdateOrderStatusServlet" method="post">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <select name="status" class="form-control">
                                        <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                        <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                                        <option value="SHIPPING" ${order.status == 'SHIPPING' ? 'selected' : ''}>Shipping</option>
                                        <option value="COMPLETED" ${order.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                                        <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm mt-1">Update</button>
                                </form>
                            </td>
                            <td>
                                <a href="OrderDetailServlet?orderId=${order.id}" class="btn btn-info btn-sm">
                                    <i class="fas fa-eye"></i> View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>