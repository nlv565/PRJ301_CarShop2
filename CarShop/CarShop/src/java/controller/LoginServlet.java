package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import category.CategoryDAO;
import category.CategoryDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import product.ProductDAO;
import product.ProductDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final String LOGIN = "index.jsp";
    private static final String USER_PAGE = "HomePageServlet";
    private static final String ADMIN_PAGE = "AdminServlet";
    private static final int USER_ROLE = 2;
    private static final int ADMIN_ROLE = 1;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "HomePageServlet";

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.loginUser(username, password);

            if (loginUser != null) {
                // Invalidate any existing session before creating a new one
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                HttpSession session = request.getSession(true);

                session.setAttribute("LOGIN_USER", loginUser);
                session.setAttribute("FULL_NAME", loginUser.getFirst_name() + " " + loginUser.getLast_name());

                int role = loginUser.getRole_id();
                session.setAttribute("USER_ROLE", role);

                if (role == USER_ROLE) {
                    response.sendRedirect("HomePageServlet");
                    return;  // Immediately return to prevent further execution
                } else if (role == ADMIN_ROLE) {
                    try {
                        List<UserDTO> listUser = dao.getListUser();
                        session.setAttribute("USER_LIST", listUser);

                        CategoryDAO cateDao = new CategoryDAO();
                        List<CategoryDTO> listCategory = cateDao.getAllCategories();
                        session.setAttribute("CATEGORY_LIST", listCategory);

                        request.getRequestDispatcher("admin.jsp").forward(request, response);
                        return;
                    } catch (Exception e) {
                        log("Error retrieving admin data: " + e.toString());
                        request.setAttribute("ERROR", "Error loading admin data.");
                        url = "login.jsp";
                    }
                } else {
                    request.setAttribute("ERROR_ROLE", "Your role is not supported.");
                    url = "login.jsp";
                }
            } else {
                request.setAttribute("ERROR", "Incorrect username/password.");
                url = "login.jsp";
            }
        } catch (Exception e) {
            log("Error at LoginServlet: " + e.toString());
            request.setAttribute("ERROR", "An unexpected error occurred. Please try again later.");
            url = "login.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
