<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Hot Deal </title>
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
        <style>
            .category-icon {
                width: 50px;  /* Độ rộng nhỏ hơn */
                height: 50px; /* Chiều cao nhỏ hơn */
                object-fit: contain; /* Giữ tỷ lệ hình ảnh */
                margin-right: 8px; /* Tạo khoảng cách với chữ */
                vertical-align: middle; /* Căn giữa theo chiều dọc */
            }

        </style>
    </head>

    <body>


        <jsp:include page="/customer-partials/_nav-bar.jsp" />


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
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Car Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Car Shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <form action="ProcessSearchServlet" method="GET">
                                    <div class="input-group w-100 mx-auto d-flex">
                                        <input type="search" name="productName" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"><button type="submit" class="btn">Search</button></i></span>
                                    </div>
                                </form>
                            </div>

                            <div class="col-6"></div>
                            
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <!-- Select All option -->
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="GetShopPageServlet">
                                                            <img src="https://icon-library.com/images/show-all-icon/show-all-icon-6.jpg" alt="All" class="category-icon">
                                                            All
                                                        </a>
                                                    </div>
                                                </li>

                                                <!-- Categories loop -->
                                                <c:forEach var="category" items="${requestScope.categories}">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="GetShopPageServletByCategory?categoryId=${category.id}">
                                                                <img src="${category.icon}" alt="${category.name}" class="category-icon">
                                                                ${category.name}
                                                            </a>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>

                                    </div>
                                   

                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/044c73103154745.5f46af6da78a3.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold"></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <c:forEach var="product" items="${requestScope.products}">
                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                            <a href="ProductDetailsServlet?pid=${product.id}" class="text-decoration-none">
                                                <div class="rounded position-relative fruite-item">
                                                    <!-- Ảnh sản phẩm -->
                                                    <div class="fruite-img">
                                                        <img src="${product.imageUrl}" class="img-fluid w-100 rounded-top" alt="${product.name}">
                                                    </div>
                                                    <!-- Nhãn danh mục -->
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        <c:forEach var="category" items="${requestScope.categories}">
                                                            <c:if test="${product.categoryId == category.id}">
                                                                ${category.name}
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>

                                                    <!-- Nội dung sản phẩm -->
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>${product.name}</h4>
                                                        <p>${product.description}</p>

                                                        <!-- Thông tin bổ sung -->
                                                        <ul class="list-unstyled mb-2">
                                                            <li><strong>Năm sản xuất:</strong> ${product.yearManufactured}</li>
                                                            <li><strong>Nhiên liệu:</strong> ${product.fuelType}</li>
                                                            <li><strong>Hộp số:</strong> ${product.transmission}</li>
                                                        </ul>

                                                        <!-- Giá & Giỏ hàng -->
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${product.price} Triệu</p>
                                                            <a href="./AddToCartServlet?pid=${product.id}&quantity=1" 
                                                               class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>  
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Car Shop End-->


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
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
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