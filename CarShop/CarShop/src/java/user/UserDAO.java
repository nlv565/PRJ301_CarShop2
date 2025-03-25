/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

/**
 *
 * @author HP
 */
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM [Users] WHERE username = ? AND password = ?";
    private static final String UPDATE_LAST_LOGIN = "UPDATE [Users] SET last_loginDate = ? WHERE id = ?";
    private static final String GET_USER_INFO = "SELECT id, username, first_name, last_name, telephone, email FROM [Users] WHERE id = ?";
    private static final String UPDATE_USER = "UPDATE [Users] SET username = ?, first_name = ?, last_name = ?, telephone = ?, email = ? WHERE id = ?";

    public static UserDTO loginUser(String username, String password) throws ClassNotFoundException, SQLException {
        // Initialize variables
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;

        try {
            // Get database connection
            conn = DBUtil.getConnection();

            // Prepare SQL statement
            ps = conn.prepareStatement(LOGIN);
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query
            rs = ps.executeQuery();

            // Process result set
            // Process result set
            // Process result set
            if (rs.next()) {
                // Retrieve user data from result set
                int userId = rs.getInt("id");
                String firstname = rs.getString("first_name");
                String lastname = rs.getString("last_name");
                String telephone = rs.getString("telephone");
                int role = rs.getInt("role_id");
                boolean isActive = rs.getBoolean("is_actived");

                // Update last login date
                LocalDateTime currentDateTime = LocalDateTime.now();
                PreparedStatement updatePs = conn.prepareStatement(UPDATE_LAST_LOGIN);
                updatePs.setTimestamp(1, Timestamp.valueOf(currentDateTime));
                updatePs.setInt(2, userId);
                updatePs.executeUpdate();
                updatePs.close();

                // Create UserDTO object
                user = new UserDTO(userId, username, password, firstname, lastname, telephone, role, isActive);
            }

        } finally {
            // Close resources
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }

    private static final String GET_ALL = "SELECT * FROM [Users]";

    public List<UserDTO> getListUser() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<UserDTO> userList = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(GET_ALL);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int userId = rs.getInt("id");
                    String username = rs.getString("username");
                    String firstName = rs.getString("first_name");
                    String email = rs.getString("email");
                    String lastName = rs.getString("last_name");
                    String telephone = rs.getString("telephone");
                    LocalDateTime createdDate = rs.getTimestamp("created_at").toLocalDateTime();
                    LocalDateTime lastLoginDate = rs.getTimestamp("last_loginDate").toLocalDateTime();
                    boolean isActive = rs.getBoolean("is_actived");
                    int roleId = rs.getInt("role_id");

                    UserDTO user = new UserDTO(userId, username, firstName, lastName, telephone, createdDate, lastLoginDate, roleId, isActive, email);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return userList;
    }

    public boolean addUser(UserDTO user) throws ClassNotFoundException {
        String sql = "INSERT INTO Users(username, password, first_name, last_name, telephone, [created_at], [last_loginDate], [modified_at], role_id, is_actived, email) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirst_name());
            ps.setString(4, user.getLast_name());
            ps.setString(5, user.getTelephone());
            ps.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now())); // Set created_date to current time
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now())); // Set last_loginDate to current time
            ps.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now())); // Set last_modified to current time
            ps.setInt(9, 2);
            ps.setBoolean(10, true);
            ps.setString(11, user.getEmail());
            int rowCount = ps.executeUpdate();
            if (rowCount > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Insert user error!" + ex.getMessage());
        }
        return false;
    }

    public UserDTO getUserInfo(int userId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(GET_USER_INFO);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String telephone = rs.getString("telephone");
                String email = rs.getString("email");

                user = new UserDTO(userId, username, firstName, lastName, telephone, email);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean updateUser(UserDTO user) throws ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement ps = conn.prepareStatement(UPDATE_USER)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFirst_name());
            ps.setString(3, user.getLast_name());
            ps.setString(4, user.getTelephone());
            ps.setString(5, user.getEmail());
            ps.setInt(6, user.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            System.out.println("Update user error: " + ex.getMessage());
        }
        return false;
    }

    public UserDTO getUserByOrderId(int orderId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;

        String GET_USER_BY_ORDER_ID
                = "SELECT u.id, u.username, u.first_name, u.last_name, u.telephone, u.email "
                + "FROM Users u "
                + "JOIN Order o ON u.id = o.user_id "
                + "WHERE o.id = ?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(GET_USER_BY_ORDER_ID);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                String username = rs.getString("username");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String telephone = rs.getString("telephone");
                String email = rs.getString("email");

                // Tạo đối tượng UserDTO với thông tin từ ResultSet
                user = new UserDTO(userId, username, firstName, lastName, telephone, email);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }
}
