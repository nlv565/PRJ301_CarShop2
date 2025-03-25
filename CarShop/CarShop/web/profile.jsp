<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="user.UserDTO" %>
<%
    UserDTO user = (UserDTO) request.getAttribute("user");
    String message = (String) request.getAttribute("message");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Hot Deal</title>
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

        <!-- Navbar start -->
        <jsp:include page="/customer-partials/_nav-bar.jsp" />
        <!-- Navbar End -->

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5" style="background-image: url('https://img.lovepik.com/photo/40189/8452.jpg_wh860.jpg'); background-size: cover; background-position: center;">
            <h1 class="text-center text-white display-6">Profiles</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Profiles</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white text-center">
                            <h4>Thông Tin Người Dùng</h4>
                        </div>
                        <div class="card-body">
                            <% if (message != null) { %>
                            <div class="alert alert-success text-center"><%= message %></div>
                            <% } %>

                            <% if (user != null) { %>
                            <form action="profile" method="post">
                                <input type="hidden" name="id" value="<%= user.getId() %>">

                                <div class="mb-3">
                                    <label class="form-label">Username:</label>
                                    <input type="text" class="form-control" name="username" value="<%= user.getUsername() %>" readonly>
                                </div>


                                <div class="mb-3">
                                    <label class="form-label">Họ:</label>
                                    <input type="text" class="form-control" name="firstName" value="<%= user.getFirst_name() %>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Tên:</label>
                                    <input type="text" class="form-control" name="lastName" value="<%= user.getLast_name() %>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Điện thoại:</label>
                                    <input type="text" class="form-control" name="telephone" value="<%= user.getTelephone() %>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email:</label>
                                    <input type="text" class="form-control" name="email" value="<%= user.getEmail() %>">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success px-4">Cập nhật</button>
                                </div>
                            </form>
                            <% } else { %>
                            <p class="text-danger text-center">Không tìm thấy thông tin người dùng!</p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5);">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#" class="text-decoration-none text-reset">
                                <h1 class="text-primary mb-0">Car Table</h1>
                                <p class="text-secondary mb-0">Car products</p>
                            </a>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">
                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="email" placeholder="Your Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href="#"><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like Us!</h4>
                            <p class="mb-4">Luxury cars are symbols of class, sophistication, and modern technology. They feature stunning designs, lavish interiors, and advanced technology. From Rolls-Royce, Bentley, and Mercedes-Maybach to Lamborghini, Ferrari, and McLaren, each car showcases its unique style, affirming the owner's prestige.</p>
                            <a href="#" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                        </div>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                       
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>