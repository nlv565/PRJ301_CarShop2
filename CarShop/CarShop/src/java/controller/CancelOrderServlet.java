/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import cart.Cart;
import cart.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import order.OrderDAO;
import order.OrderDTO;
import orderdetail.OrderDetailDAO;
import orderdetail.OrderDetailDTO;
import user.UserDTO;

/**
 *
 * @author HP
 */
@WebServlet(name = "CancelOrderServlet", urlPatterns = {"/CancelOrderServlet"})
public class CancelOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdParam = request.getParameter("orderId");

        if (orderIdParam != null) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                orderDAO.updateOrderStatus(orderId, "CANCELLED");
                response.sendRedirect("MyOrderServlet");
            } catch (NumberFormatException e) {
                response.getWriter().write("error");
            } catch (SQLException ex) {
                Logger.getLogger(CancelOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CancelOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.getWriter().write("error");
        }
    }
}
