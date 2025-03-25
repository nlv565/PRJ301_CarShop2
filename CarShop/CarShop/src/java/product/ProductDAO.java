package product;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class ProductDAO {

    // SQL queries for CRUD operations
    private static final String INSERT_PRODUCT = "INSERT INTO Product (name, description, price, discount_percent, expiration, category_id, created_at, inventory, image, is_actived, year_manufactured, fuel_type, transmission) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Product WHERE is_actived = 1";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM Product WHERE id = ?";
    private static final String UPDATE_PRODUCT = "UPDATE Product SET name = ?, description = ?, price = ?, discount_percent = ?, expiration = ?, category_id = ?, created_at = ?, inventory = ?, image = ?, is_actived = ?, year_manufactured = ?, fuel_type = ?, transmission = ? WHERE id = ?";
    private static final String DELETE_PRODUCT = "DELETE FROM Product WHERE id = ?";
    private static final String SELECT_PRODUCT_COUNT_BY_CATEGORY_ID = "SELECT COUNT(*) AS product_count FROM Product WHERE category_id = ?";
    private static final String SELECT_PRODUCTS_BY_CATEGORY_ID = "SELECT * FROM Product WHERE category_id = ?";
    private static final String GET_CATEGORY_NAME_BY_ID_QUERY
            = "SELECT Category.name "
            + "FROM Category "
            + "JOIN Product ON Category.id = Product.category_id "
            + "WHERE Product.id = ?";
    private static final String SELECT_PRODUCTS_BY_NAME_LIKE = "SELECT * FROM Product WHERE LOWER(name) LIKE LOWER(?)";
    private static final String UPDATE_PRODUCTS_STATUS_BY_CATEGORY_ID
            = "UPDATE Product SET is_actived = 0 WHERE category_id = ?";

    public String getCategoryNameById(int productId) throws ClassNotFoundException {
        String categoryName = null;

        try (
                // Establish connection
                 Connection connection = DBUtil.getConnection(); // Prepare statement
                  PreparedStatement statement = connection.prepareStatement(GET_CATEGORY_NAME_BY_ID_QUERY);) {
            // Set product ID parameter
            statement.setInt(1, productId);
            // Execute query
            try ( ResultSet resultSet = statement.executeQuery()) {
                // If result set is not empty, retrieve category name
                if (resultSet.next()) {
                    categoryName = resultSet.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryName;
    }

    // Method to insert a new product into the database
    public void addProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT)) {

            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setDouble(4, product.getDiscountPercent());
            stmt.setTimestamp(5, Timestamp.valueOf(product.getExpiration()));
            stmt.setInt(6, product.getCategoryId());
            stmt.setTimestamp(7, Timestamp.valueOf(product.getCreatedAt()));
            stmt.setInt(8, product.getInventory());
            stmt.setString(9, product.getImageUrl());
            stmt.setBoolean(10, product.isIsActive());
            stmt.setString(11, product.getYearManufactured());
            stmt.setString(12, product.getFuelType());
            stmt.setString(13, product.getTransmission());

            stmt.executeUpdate();
        }
    }

    // Method to retrieve all products from the database
    public List<ProductDTO> getAllProducts() throws SQLException, ClassNotFoundException {
        List<ProductDTO> products = new ArrayList<>();
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }

    // Method to retrieve a product by its ID from the database
    public ProductDTO getProductById(int id) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToProduct(rs);
                }
            }
        }
        return null;
    }

    // Method to update a product in the database
    public void updateProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(UPDATE_PRODUCT)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setDouble(4, product.getDiscountPercent());
            stmt.setTimestamp(5, Timestamp.valueOf(product.getExpiration()));
            stmt.setInt(6, product.getCategoryId());
            stmt.setTimestamp(7, Timestamp.valueOf(product.getCreatedAt()));
            stmt.setInt(8, product.getInventory());
            stmt.setString(9, product.getImageUrl());
            stmt.setBoolean(10, product.isIsActive());
            stmt.setString(11, product.getYearManufactured());
            stmt.setString(12, product.getFuelType());
            stmt.setString(13, product.getTransmission());
            stmt.setInt(14, product.getId());
            stmt.executeUpdate();
        }
    }

    // Method to delete a product from the database
    public void deleteProduct(int id) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(DELETE_PRODUCT)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public void deactivateProductsByCategoryId(int categoryId) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(UPDATE_PRODUCTS_STATUS_BY_CATEGORY_ID)) {

            stmt.setInt(1, categoryId);
            int rowsAffected = stmt.executeUpdate();

            System.out.println(rowsAffected + " sản phẩm trong danh mục ID " + categoryId + " đã bị vô hiệu hóa (is_actived = false).");
        }
    }

    // Helper method to map ResultSet to Product object
    private ProductDTO mapResultSetToProduct(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        double price = rs.getDouble("price");
        double discountPercent = rs.getDouble("discount_percent");

        // Retrieve expiration as Timestamp and convert to LocalDateTime
        Timestamp expirationTimestamp = rs.getTimestamp("expiration");
        LocalDateTime expiration = expirationTimestamp.toLocalDateTime();

        int categoryId = rs.getInt("category_id");
        String url = rs.getString("image");
        LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
        int inventory = rs.getInt("inventory");
        boolean isActive = rs.getBoolean("is_actived");

        // Thêm ba trường mới
        String yearManufactured = rs.getString("year_manufactured");
        String fuelType = rs.getString("fuel_type");
        String transmission = rs.getString("transmission");

        return new ProductDTO(id, name, description, price, discountPercent, expiration,
                categoryId, createdAt, inventory, url, isActive,
                yearManufactured, fuelType, transmission);
    }

    public int getProductCountByCategoryId(int categoryId) throws SQLException, ClassNotFoundException {
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCT_COUNT_BY_CATEGORY_ID)) {
            stmt.setInt(1, categoryId);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("product_count");
                }
            }
        }
        return 0; // Return 0 if no product count found or an error occurs
    }

    public List<ProductDTO> getProductsByCategoryId(int categoryId) throws SQLException, ClassNotFoundException {
        List<ProductDTO> products = new ArrayList<>();
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY_ID)) {
            stmt.setInt(1, categoryId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }

    public List<ProductDTO> getProductsByName(String name) throws SQLException, ClassNotFoundException {
        List<ProductDTO> products = new ArrayList<>();
        try ( Connection conn = DBUtil.getConnection();  PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCTS_BY_NAME_LIKE)) {
            // Convert name to lower case for case insensitive search
            String searchName = "%" + name.toLowerCase() + "%";
            stmt.setString(1, searchName);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ProductDAO productDAO = new ProductDAO();

        // Example: Search for products containing "apple" (case insensitive)
        List<ProductDTO> productList = productDAO.getProductsByName("Peppa");

        // Print out the results
        for (ProductDTO product : productList) {
            System.out.println(product.getName());
        }
    }
}
