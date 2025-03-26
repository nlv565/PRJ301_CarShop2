
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>T</title>
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
<html>
<head>
    <meta charset="UTF-8">
    <title>Chatbot Tư Vấn Xe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .chat-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 320px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 9999;
            display: none;
            cursor: grab;
        }
        .chat-header {
            background: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
            cursor: move;
        }
        .chat-box {
            height: 300px;
            overflow-y: auto;
            padding: 5px;
            border: 1px solid #ccc;
            background: #fff;
            font-size: 14px;
        }
        .input-box {
            display: flex;
            margin-top: 10px;
        }
        input {
            flex: 1;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 5px 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .toggle-btn {
            position: fixed;
            bottom: 20px;
            right: 350px;
            padding: 10px 15px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<button class="toggle-btn" onclick="toggleChat()">💬 Mở Chat</button>
<div class="chat-container" id="chatContainer">
    <div class="chat-header" id="chatHeader">💬 Chatbot Tư Vấn Xe</div>
    <div class="chat-box" id="chatBox"></div>
    <div class="input-box">
        <input type="text" id="userInput" placeholder="Nhập câu hỏi...">
        <button onclick="sendMessage()">Gửi</button>
    </div>
</div>

<script>
    function toggleChat() {
        let chatContainer = document.getElementById("chatContainer");
        let toggleBtn = document.querySelector(".toggle-btn");
        if (chatContainer.style.display === "none" || chatContainer.style.display === "") {
            chatContainer.style.display = "block";
            toggleBtn.textContent = "❌ Đóng Chat";
        } else {
            chatContainer.style.display = "none";
            toggleBtn.textContent = "💬 Mở Chat";
        }
    }

    function sendMessage() {
        let inputField = document.getElementById("userInput");
        let chatBox = document.getElementById("chatBox");
        let userMessage = inputField.value.trim();

        if (userMessage === "") return;

        chatBox.innerHTML += "<p><strong>Bạn:</strong> " + userMessage + "</p>";
        inputField.value = "";

        fetch("chatbot", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "message=" + encodeURIComponent(userMessage)
        })
        .then(response => response.text())
        .then(data => {
            chatBox.innerHTML += "<p><strong>Chatbot:</strong> " + data + "</p>";
            chatBox.scrollTop = chatBox.scrollHeight;
        })
        .catch(error => console.error("Lỗi:", error));
    }

    let chatContainer = document.getElementById("chatContainer");
    let chatHeader = document.getElementById("chatHeader");
    let isDragging = false;
    let offsetX, offsetY;

    chatHeader.addEventListener("mousedown", (e) => {
        isDragging = true;
        offsetX = e.clientX - chatContainer.offsetLeft;
        offsetY = e.clientY - chatContainer.offsetTop;
        chatContainer.style.cursor = "grabbing";
    });

    document.addEventListener("mousemove", (e) => {
        if (isDragging) {
            chatContainer.style.left = (e.clientX - offsetX) + "px";
            chatContainer.style.top = (e.clientY - offsetY) + "px";
        }
    });

    document.addEventListener("mouseup", () => {
        isDragging = false;
        chatContainer.style.cursor = "grab";
    });
</script>

</body>
</html>
        <jsp:include page="/customer-partials/_nav-bar.jsp" />



<!--        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
         Modal Search End -->


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Reasonable</h4>
                        <h1 class="mb-5 display-3 text-primary">Welcome to our shop</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="https://t4.ftcdn.net/jpg/04/64/99/31/360_F_464993155_P0xFAgAWo3EYTuiyu62zQkj3OWamMslW.jpg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://www.shutterstock.com/image-photo/same-white-suv-cars-rows-600nw-2421250075.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Features Section Start -->
        <div class="container-fluid featurs py-5" style="position: relative; background: url('https://picture.lk/files/preview/1280x717/11722427168xdymkkquwqats7umjwj2zuqihiinlwr34dwuhz5qlposlbc5euzhyyf0wtqafu025u16fjpi2j1wlbq3tkqrkz4x8metsuv8zbjb.jpg') no-repeat center center/cover;">
            <div class="overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5);"></div>
            <div class="container py-5 position-relative">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4 shadow">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-4 mx-auto">
                                <i class="fas fa-car fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5 class="fw-bold">Free Test Drive</h5>
                                <p class="mb-0">Experience before you buy</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4 shadow">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-4 mx-auto">
                                <i class="fas fa-shield-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5 class="fw-bold">Secure Payment</h5>
                                <p class="mb-0">100% safe transaction</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4 shadow">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-4 mx-auto">
                                <i class="fas fa-tools fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5 class="fw-bold">Warranty & Service</h5>
                                <p class="mb-0">Up to 5 years guarantee</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4 shadow">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-4 mx-auto">
                                <i class="fas fa-headset fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5 class="fw-bold">24/7 Customer Support</h5>
                                <p class="mb-0">Always here to assist you</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features Section End -->

        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Products</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <c:forEach var="category" items="${categories}">
                                    <li class="nav-item">
                                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-${category.id}">
                                            <span class="text-dark" style="width: 130px;">${category.name}</span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${product.imageUrl}" class="img-fluid w-100 rounded-top" alt="${product.name}">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                        <c:forEach var="category" items="${requestScope.categories}">
                                                            <c:if test="${product.categoryId == category.id}">
                                                                ${category.name}
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>${product.name}</h4>
                                                        <p>${product.description}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${product.price} Triệu</p>
                                                            <a href="AddToCartServlet?pid=${product.id}&&quantity=1" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->



        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Hot Deals</h1>
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
                                      <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="">About Us</a>
                            <a class="btn-link" href="">Contact Us</a>
                            <a class="btn-link" href="">Privacy Policy</a>
                            <a class="btn-link" href="">Terms & Condition</a>
                            <a class="btn-link" href="">Return Policy</a>
                            <a class="btn-link" href="">FAQs & Help</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="">My Account</a>
                            <a class="btn-link" href="">Shopping Cart</a>
                            <a class="btn-link" href="">Wishlist</a>
                            <a class="btn-link" href="">Order History</a>
                            <a class="btn-link" href="">International Orders</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address:107 Trần Đại Nghĩa </p>
                            <p>Email: minhnhatvodung@gmail.com</p>
                            <p>Phone:(+84)395204021</p>
                            <p>Payment Accepted</p>
                            <img src="img/payment.png" class="img-fluid" alt="">
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
