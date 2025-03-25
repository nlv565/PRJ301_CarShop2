/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import category.CategoryDAO;
import category.CategoryDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import order.OrderDAO;
import order.OrderDTO;
import order.OrderDetailWithOrderDTO;
import orderdetail.OrderDetailDAO;
import orderdetail.OrderDetailDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author ADMIN-PC
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/OrderDetailServlet"})
public class OrderDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO;
    private UserDAO userDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
        orderDetailDAO = new OrderDetailDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect("OrderManagement.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdStr);
            OrderDetailWithOrderDTO orderDetails = orderDAO.getOrderDetailsWithOrderInfo(orderId);
//            UserDTO userDTO = userDAO.getUserByOrderId(orderId);
//            request.setAttribute("user", userDTO);
            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("orderDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("OrderManagement.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
