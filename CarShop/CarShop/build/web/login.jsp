<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Car Haven - Login</title>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body class="bg-amber-50">
        <!-- Background Pattern -->
        <div class="fixed inset-0 bg-repeat opacity-10 z-0" style="background-image: url('https://www.transparenttextures.com/patterns/food.png');"></div>

        <!-- Main Container -->
        <div class="min-h-screen flex items-center justify-center p-4 relative z-10">
            <div class="w-full max-w-md">
                <!-- Login Card -->
                <div class="bg-white rounded-2xl shadow-xl overflow-hidden border-2 border-amber-200">
                    <!-- Header with Car Images -->
                    <div class="bg-gradient-to-r from-amber-400 to-yellow-300 p-6 relative">
                        <div class="absolute -top-6 -left-6 w-20 h-20 bg-contain bg-no-repeat" style="background-image: url('https://cdn-icons-png.flaticon.com/512/2553/2553691.png');"></div>
                        <div class="absolute -top-4 -right-4 w-16 h-16 bg-contain bg-no-repeat" style="background-image: url('https://cdn-icons-png.flaticon.com/512/2553/2553651.png');"></div>
                        <h1 class="text-3xl font-bold text-center text-amber-900 mt-4 mb-1">Car Haven</h1>
                        <p class="text-amber-800 text-center text-sm">Beautiful car just a login away!</p>
                    </div>

                    <!-- Login Form -->
                    <div class="p-8">
                        <h2 class="text-2xl font-semibold text-amber-900 mb-6 text-center">Welcome Back</h2>

                        <form action="LoginServlet" method="post">
                            <div class="mb-6">
                                <label for="username" class="block text-amber-800 mb-2 font-medium">Username</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-user"></i>
                                    </span>
                                    <input type="text" id="username" name="username" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="Enter your username" required>
                                </div>
                            </div>

                            <div class="mb-6">
                                <label for="password" class="block text-amber-800 mb-2 font-medium">Password</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-lock"></i>
                                    </span>
                                    <input type="password" id="password" name="password" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="Enter your password" required>
                                </div>
                            </div>

                            <%
                            String errorMessage = (String) request.getAttribute("ERROR");
                            String errorRoleMessage = (String) request.getAttribute("ERROR_ROLE");
                            if (errorMessage != null || errorRoleMessage != null) {
                            %>
                            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded">
                                <p class="text-sm"><%= errorMessage != null ? errorMessage : errorRoleMessage %></p>
                            </div>
                            <%
                            }
                            %>

                            <button type="submit" 
                                    class="w-full bg-gradient-to-r from-amber-500 to-yellow-400 text-white font-medium py-3 px-4 rounded-lg hover:from-amber-600 hover:to-yellow-500 transition duration-300 shadow-md">
                                Sign In <i class="fas fa-arrow-right ml-2"></i>
                            </button>
                        </form>

                        <div class="mt-6 text-center">
                            <p class="text-amber-800">
                                Don't have an account? 
                                <a href="SignupServlet" class="text-amber-600 font-semibold hover:text-amber-700 transition duration-300">Sign Up</a>
                            </p>
                        </div>

                        
                    </div>
                </div>

                <!-- Footer -->
                <p class="text-center text-amber-800 text-sm mt-6">© 2025 Car Haven. All rights reserved.</p>
            </div>
        </div>
    </body>
</html>