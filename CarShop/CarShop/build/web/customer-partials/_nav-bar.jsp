<%-- 
    Document   : nav-bar
    Created on : Apr 22, 2024, 1:44:09 AM
    Author     : HP
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Shop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Profile Model -->
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Viet Nam</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Please Log in for more !!</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="HomePageServlet" class="navbar-brand"><h1 class="text-primary display-6">Car Shop</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="HomePageServlet" class="nav-item nav-link active">Home</a>
                            <a href="GetShopPageServlet" class="nav-item nav-link">Shop</a>
                            <a href="profile" class="nav-item nav-link">Profile</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="GetCartServlet" class="dropdown-item">Cart</a>
                                    <a href="CheckoutServlet" class="dropdown-item">Checkout</a>
<!--                                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                    <a href="404.html" class="dropdown-item">404 Page</a>-->
                                </div>
                            </div>
                            <a href="MyOrderServlet" class="nav-item nav-link">My Order</a>
                        </div>
                        <div class="d-flex align-items-center m-3 me-0">
<!--                            <button class="btn btn-search btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal">
                                <i class="fas fa-search text-primary"></i>
                            </button>-->

                            <a href="GetCartServlet" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-white px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                                </span>
                            </a>

                            <c:choose>
                                <c:when test="${empty sessionScope.LOGIN_USER}">
                                    <a href="login.jsp" class="my-auto text-dark text-decoration-none">
                                        <p class="mb-0">Login/Sign Up</p>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <div class="my-auto">
                                        <p class="mb-0 me-2">Welcome, ${sessionScope.FULL_NAME}!</p>
                                        <a href="LogoutServlet" class="text-dark text-decoration-none">Logout</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
        <script>
            function logout() {
                fetch('DispatchServlet?action=logout', {
                    method: 'POST' // Specify the method as POST
                })
                        .then(response => {
                            if (response.redirected) {
                                window.location.href = response.url; // Redirect to the login page
                            }
                        })
                        .catch(error => {
                            console.error('Error logging out:', error);
                        });
            }
        </script>
    </body>
</html>
