x<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Spinner Start -->

        <!-- Spinner End -->


        <!-- Navbar start -->
        <jsp:include page="/customer-partials/_nav-bar.jsp" />
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">

                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5" style="background-image: url('https://img.lovepik.com/photo/40189/8452.jpg_wh860.jpg'); background-size: cover; background-position: center;">
            <h1 class="text-center text-white display-6">Checkout</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Checkout</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <form action="CheckoutServlet" method="post">
            <div class="container-fluid py-5">
                <div class="container py-5">
                    <h1 class="mb-4">Billing details</h1>
                    <form action="#">
                        <div class="row g-5">
                            <div class="col-md-12 col-lg-6 col-xl-7">
                                <div class="form-item">
                                    <label class="form-label my-3" for="address">Address <sup>*</sup></label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="House Number Street Name" required>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3" for="town_city">Town/City<sup>*</sup></label>
                                    <input type="text" class="form-control" id="town_city" name="town_city" required>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3" for="country">Country<sup>*</sup></label>
                                    <input type="text" class="form-control" id="country" name="country" required>
                                </div>
                                <div class="form-check my-3">
                                </div>
                                <div class="form-item">
                                    <textarea name="order_notes" id="order_notes" class="form-control" spellcheck="false" cols="30" rows="11" placeholder="Order Notes (Optional)"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-6 col-xl-5">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Products</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center mt-2">
                                                            <img src="${cart.getProduct().getImageUrl()}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td class="py-5">${cart.getProduct().getName()}</td>
                                                    <td class="py-5">${cart.getProduct().getPrice()} Triệu</td>
                                                    <td class="py-5">${cart.getQuantity()}</td>
                                                    <td class="py-5">${cart.getProduct().getPrice() * cart.getQuantity()} Triệu</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <th scope="row">
                                                </th>
                                                <td class="py-5"></td>
                                                <td class="py-5"></td>
                                                <td class="py-5">
                                                    <p class="mb-0 text-dark py-3">Subtotal</p>
                                                </td>
                                                <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                                    <c:set var="subtotal" value="${cart.getProduct().getPrice() * cart.getQuantity()}" />
                                                    <c:set var="totalAmount" value="${totalAmount + subtotal}" /> <!-- Tính tổng tiền -->
                                                </c:forEach>
                                                <td class="py-5">
                                                    <div class="py-3 border-bottom border-top">
                                                        <p class="mb-0 text-dark">${totalAmount} Triệu</p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                </th>
                                                <td class="py-5">
                                                    <p class="mb-0 text-dark text-uppercase py-3">TOTAL</p>
                                                </td>
                                                <td class="py-5"></td>
                                                <td class="py-5"></td>
                                                <td class="py-5">
                                                    <div class="py-3 border-bottom border-top">
                                                        <p class="mb-0 text-dark">${totalAmount} Triệu</p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                    <input type="hidden" name="totalPrice" value="${totalAmount}">
                                    <button type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </form>

        <!-- Checkout Page End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Car Table</h1>
                                <p class="text-secondary mb-0">Car products</p>
                            </a>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">
                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">Luxury cars are symbols of class, sophistication, and modern technology. They feature stunning designs, lavish interiors, and advanced technology. From Rolls-Royce, Bentley, and Mercedes-Maybach to Lamborghini, Ferrari, and McLaren, each car showcases its unique style, affirming the owner's prestige.</p>
                            <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
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