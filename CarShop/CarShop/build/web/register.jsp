<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Car Haven - Sign Up</title>
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
        <div class="min-h-screen flex items-center justify-center p-4 relative z-10 py-10">
            <div class="w-full max-w-lg">
                <!-- Signup Card -->
                <div class="bg-white rounded-2xl shadow-xl overflow-hidden border-2 border-amber-200">
                    <!-- Header with Car Images -->
                    <div class="bg-gradient-to-r from-amber-400 to-yellow-300 p-6 relative">
                        <div class="absolute -top-6 -left-6 w-20 h-20 bg-contain bg-no-repeat" style="background-image: url('https://cdn-icons-png.flaticon.com/512/2553/2553691.png');"></div>
                        <div class="absolute -top-4 -right-4 w-16 h-16 bg-contain bg-no-repeat" style="background-image: url('https://cdn-icons-png.flaticon.com/512/2553/2553651.png');"></div>
                        <h1 class="text-3xl font-bold text-center text-amber-900 mt-4 mb-1">Car Haven</h1>
                        <p class="text-amber-800 text-center text-sm">Join our Car-loving community!</p>
                    </div>

                    <!-- Signup Form -->
                    <div class="p-8">
                        <h2 class="text-2xl font-semibold text-amber-900 mb-6 text-center">Create Your Account</h2>

                        <form action="SignupServlet" method="post" onsubmit="return validateForm()">
                            <!-- Username -->
                            <div class="mb-5">
                                <label for="username" class="block text-amber-800 mb-2 font-medium">Username</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-user"></i>
                                    </span>
                                    <input type="text" id="username" name="username" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="Choose a username" required minlength="4" maxlength="20">
                                </div>
                                <p class="text-xs text-amber-700 mt-1">4-20 characters</p>
                            </div>

                            <!-- First Name and Last Name (side by side) -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mb-5">
                                <div>
                                    <label for="firstName" class="block text-amber-800 mb-2 font-medium">First Name</label>
                                    <div class="relative">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                            <i class="fas fa-user-tag"></i>
                                        </span>
                                        <input type="text" id="firstName" name="firstName" 
                                               class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                               placeholder="Your first name" required pattern="[A-Za-z]+" title="Only letters allowed">
                                    </div>
                                </div>
                                <div>
                                    <label for="lastName" class="block text-amber-800 mb-2 font-medium">Last Name</label>
                                    <div class="relative">
                                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                            <i class="fas fa-user-tag"></i>
                                        </span>
                                        <input type="text" id="lastName" name="lastName" 
                                               class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                               placeholder="Your last name" required pattern="[A-Za-z]+" title="Only letters allowed">
                                    </div>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="mb-5">
                                <label for="email" class="block text-amber-800 mb-2 font-medium">Email</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-envelope"></i>
                                    </span>
                                    <input type="email" id="email" name="email" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="your.email@example.com" required>
                                </div>
                            </div>

                            <!-- Phone -->
                            <div class="mb-5">
                                <label for="phone" class="block text-amber-800 mb-2 font-medium">Phone</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-phone"></i>
                                    </span>
                                    <input type="tel" id="phone" name="phone" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="10-digit phone number" required pattern="[0-9]{10}" title="Phone number must be 10 digits">
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="mb-6">
                                <label for="password" class="block text-amber-800 mb-2 font-medium">Password</label>
                                <div class="relative">
                                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-500">
                                        <i class="fas fa-lock"></i>
                                    </span>
                                    <input type="password" id="password" name="password" 
                                           class="w-full py-3 pl-10 pr-4 border-2 border-amber-200 rounded-lg focus:outline-none focus:border-amber-400"
                                           placeholder="Create a password" required minlength="6">
                                </div>
                                <p class="text-xs text-amber-700 mt-1">Minimum 6 characters</p>
                            </div>

                            <!-- Error Message -->
                            <c:if test="${not empty error}">
                                <div class="">
                                    <p class="text-sm">${error}</p>
                                </div>
                            </c:if>

                            <!-- Submit Button -->
                            <button type="submit" 
                                    class="w-full bg-gradient-to-r from-amber-500 to-yellow-400 text-white font-medium py-3 px-4 rounded-lg hover:from-amber-600 hover:to-yellow-500 transition duration-300 shadow-md">
                                Create Account <i class="fas fa-user-plus ml-2"></i>
                            </button>
                        </form>

                        <!-- Login Link -->
                        <div class="mt-6 text-center">
                            <p class="text-amber-800">
                                Already have an account? 
                                <a href="login.jsp" class="text-amber-600 font-semibold hover:text-amber-700 transition duration-300">Log In</a>
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