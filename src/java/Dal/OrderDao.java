package Dal;

import Model.*;
import java.beans.Statement;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class OrderDao extends DBContext {

    public List<Order> getAllOrdersByUserId(int userId) {
        Map<Integer, Order> orderMap = new LinkedHashMap<>(); // Using LinkedHashMap to maintain insertion order

        String sql = "SELECT "
                + "   O.id AS orderId, "
                + "   O.orderDate, "
                + "   O.total AS total,"
                + "   O.name AS name, "
                + "   S.id AS statusId, "
                + "   S.name AS status, "
                + "   P.id AS productId, "
                + "   P.name AS productName, "
                + "   P.image AS productImage, "
                + "   OD.nameProduct, "
                + "   OD.price, "
                + "   OD.quantity, "
                + "   OD.total AS detailTotal, "
                + "   B.name AS brandName, "
                + "   C.name AS categoryName "
                + "FROM "
                + "   Orders O "
                + "JOIN "
                + "   Status S ON O.statusId = S.id "
                + "JOIN "
                + "   OrderDetail OD ON OD.oid = O.id "
                + "JOIN "
                + "   Product P ON OD.pid = P.id "
                + "JOIN "
                + "   Brand B ON P.bid = B.id "
                + "JOIN "
                + "   Category C ON P.cid = C.id "
                + "JOIN "
                + "   Users U ON O.userId = U.id "
                + "WHERE "
                + "   O.userId = ? "
                + "ORDER BY "
                + "   O.id DESC"; // Ordering by orderId in descending order

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    Order order = orderMap.get(orderId);

                    if (order == null) {
                        order = new Order();
                        order.setId(orderId);
                        order.setDate(rs.getDate("orderDate"));
                        order.setTotal(rs.getInt("total"));
                        order.setName(rs.getString("name"));
                        Status statusObj = new Status();
                        statusObj.setStatus(rs.getString("status"));
                        statusObj.setId(rs.getInt("statusId"));
                        order.setStatusid(statusObj);

                        User user = new User();
                        user.setId(userId);

                        order.setUserId(user);

                        orderMap.put(orderId, order);
                    }

                    Brand brand = new Brand();
                    brand.setName(rs.getString("brandName"));

                    Category category = new Category();
                    category.setName(rs.getString("categoryName"));

                    Product product = new Product();
                    product.setId(rs.getInt("productId"));
                    product.setName(rs.getString("productName"));
                    product.setImage(rs.getString("productImage"));
                    product.setPrice(rs.getInt("price"));
                    product.setBrand(brand);
                    product.setCategory(category);

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setNameProduct(rs.getString("nameProduct"));
                    orderDetail.setPrice(rs.getInt("price"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setTotal(rs.getInt("detailTotal"));
                    orderDetail.setPid(product);

                    order.addOrderDetail(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(orderMap.values());
    }

    public List<Order> getAllOrdersByUserIdAndStatusId(int userId, int statusId) {
        Map<Integer, Order> orderMap = new LinkedHashMap<>(); // Using LinkedHashMap to maintain insertion order

        String sql = "SELECT "
                + "   O.id AS orderId, "
                + "   O.orderDate, "
                + "   O.total AS total, "
                + "   O.name AS name, "
                + "   S.id AS statusId, "
                + "   S.name AS status, "
                + "   P.id AS productId, "
                + "   P.name AS productName, "
                + "   P.image AS productImage, "
                + "   OD.price, "
                + "   OD.quantity, "
                + "   OD.total AS detailTotal, "
                + "   B.name AS brandName, "
                + "   C.name AS categoryName "
                + "FROM "
                + "   Orders O "
                + "JOIN "
                + "   Status S ON O.statusId = S.id "
                + "JOIN "
                + "   OrderDetail OD ON OD.oid = O.id "
                + "JOIN "
                + "   Product P ON OD.pid = P.id "
                + "JOIN "
                + "   Brand B ON P.bid = B.id "
                + "JOIN "
                + "   Category C ON P.cid = C.id "
                + "JOIN "
                + "   Users U ON O.userId = U.id "
                + "WHERE "
                + "   O.userId = ? AND O.statusId = ? "
                + "ORDER BY "
                + "   O.id DESC"; // Ordering by orderId in descending order

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, statusId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    Order order = orderMap.get(orderId);

                    if (order == null) {
                        order = new Order();
                        order.setId(orderId);
                        order.setDate(rs.getDate("orderDate"));
                        order.setTotal(rs.getInt("total"));
                        order.setName(rs.getString("name"));
                        Status statusObj = new Status();
                        statusObj.setStatus(rs.getString("status"));
                        statusObj.setId(rs.getInt("statusId"));
                        order.setStatusid(statusObj);

                        User user = new User();
                        user.setId(userId);

                        order.setUserId(user);

                        orderMap.put(orderId, order);
                    }

                    Brand brand = new Brand();
                    brand.setName(rs.getString("brandName"));

                    Category category = new Category();
                    category.setName(rs.getString("categoryName"));

                    Product product = new Product();
                    product.setId(rs.getInt("productId"));
                    product.setName(rs.getString("productName"));
                    product.setImage(rs.getString("productImage"));
                    product.setPrice(rs.getInt("price"));
                    product.setBrand(brand);
                    product.setCategory(category);

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setPrice(rs.getInt("price"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setTotal(rs.getInt("detailTotal"));
                    orderDetail.setPid(product);

                    order.addOrderDetail(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(orderMap.values());
    }

    public void addOrder(Order order) {
        String insertOrderSql = "INSERT INTO Orders (userId, name, phone, province, district, commune, detailedAddress, orderDate, total, statusId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertOrderDetailSql = "INSERT INTO OrderDetail (oid, pid, nameProduct, variantId, price, quantity, total) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            // Start a transaction
            connection.setAutoCommit(false);

            // Insert into Orders table
            PreparedStatement orderStmt = connection.prepareStatement(insertOrderSql, PreparedStatement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, order.getUserId().getId());
            orderStmt.setString(2, order.getName());
            orderStmt.setString(3, order.getPhone());
            orderStmt.setString(4, order.getProvince());
            orderStmt.setString(5, order.getDistrict());
            orderStmt.setString(6, order.getCommune());
            orderStmt.setString(7, order.getDetailedAddress());

            // Convert java.util.Date to java.sql.Timestamp
            java.util.Date utilDate = order.getDate();
            if (utilDate != null) {
                orderStmt.setTimestamp(8, new java.sql.Timestamp(utilDate.getTime()));
            } else {
                orderStmt.setTimestamp(8, null);
            }

            orderStmt.setDouble(9, order.getTotal());
            orderStmt.setInt(10, order.getStatusid().getId());

            int affectedRows = orderStmt.executeUpdate();

            if (affectedRows == 0) {
                connection.rollback();
                throw new SQLException("Creating order failed, no rows affected.");
            }

            // Get the generated order ID
            int orderId;
            try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                } else {
                    connection.rollback();
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }

            // Insert into OrderDetail table
            PreparedStatement orderDetailStmt = connection.prepareStatement(insertOrderDetailSql);
            for (OrderDetail detail : order.getOrderDetails()) {
                orderDetailStmt.setInt(1, orderId);
                orderDetailStmt.setInt(2, detail.getPid().getId());
                orderDetailStmt.setString(3, detail.getNameProduct());
                orderDetailStmt.setInt(4, detail.getVariantId().getId());
                orderDetailStmt.setDouble(5, detail.getPrice());
                orderDetailStmt.setInt(6, detail.getQuantity());
                orderDetailStmt.setDouble(7, detail.getTotal());

                orderDetailStmt.addBatch();
            }

            orderDetailStmt.executeBatch();

            // Commit the transaction
            connection.commit();
        } catch (SQLException e) {
            System.out.println("Error occurred while adding order: " + e.getMessage());
            e.printStackTrace(); // Print the full stack trace for debugging purposes
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public Status getStatusById(int id) {
        String sql = "SELECT id, name FROM Status WHERE id = ?";
        Status status = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                status = new Status();
                status.setId(resultSet.getInt("id"));
                status.setStatus(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    // Method to retrieve an order by orderId
    public Order getOrderByOrderId(int orderId) {
        Order order = null;
        String sql = "SELECT "
                + "   O.id AS orderId, "
                + "   O.name AS orderName, " // Lấy trường name từ bảng Orders
                + "   O.orderDate, "
                + "   O.total AS total, "
                + "   S.id AS statusId, "
                + "   S.name AS status, "
                + "   P.id AS productId, "
                + "   P.name AS productName, "
                + "   P.image AS productImage, "
                + "   OD.nameProduct, "
                + "   OD.price, "
                + "   OD.quantity, "
                + "   OD.total AS detailTotal, "
                + "   B.name AS brandName, "
                + "   C.name AS categoryName, "
                + "   U.fullName, "
                + "   O.province, "
                + "   O.district, "
                + "   O.commune, "
                + "   O.detailedAddress "
                + "FROM "
                + "   Orders O "
                + "JOIN "
                + "   Status S ON O.statusId = S.id "
                + "JOIN "
                + "   OrderDetail OD ON OD.oid = O.id "
                + "JOIN "
                + "   Product P ON OD.pid = P.id "
                + "JOIN "
                + "   Brand B ON P.bid = B.id "
                + "JOIN "
                + "   Category C ON P.cid = C.id "
                + "LEFT JOIN " // Sử dụng LEFT JOIN để tránh mất dữ liệu nếu không có sản phẩm nào trong đơn hàng
                + "   Users U ON O.userId = U.id "
                + "WHERE "
                + "   O.id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    if (order == null) {
                        order = new Order();
                        order.setId(orderId);
                        order.setName(rs.getString("orderName")); // Lấy name từ bảng Orders
                        order.setDate(rs.getDate("orderDate"));
                        order.setTotal(rs.getDouble("total"));

                        Status statusObj = new Status();
                        statusObj.setId(rs.getInt("statusId"));
                        statusObj.setStatus(rs.getString("status"));
                        order.setStatusid(statusObj);

                        // Không cần lấy fullName từ bảng Users nữa
                        order.setProvince(rs.getString("province"));
                        order.setDistrict(rs.getString("district"));
                        order.setCommune(rs.getString("commune"));
                        order.setDetailedAddress(rs.getString("detailedAddress"));
                    }

                    // Create OrderDetail object and set its properties
                    Brand brand = new Brand();
                    brand.setName(rs.getString("brandName"));

                    Category category = new Category();
                    category.setName(rs.getString("categoryName"));

                    Product product = new Product();
                    product.setId(rs.getInt("productId"));
                    product.setName(rs.getString("productName"));
                    product.setImage(rs.getString("productImage"));
                    product.setBrand(brand);
                    product.setCategory(category);

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setNameProduct(rs.getString("nameProduct"));
                    orderDetail.setPrice(rs.getInt("price"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setTotal(rs.getInt("detailTotal"));
                    orderDetail.setPid(product);

                    // Add OrderDetail to the Order's list of OrderDetails
                    order.addOrderDetail(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id AS order_id, o.orderDate, o.total, o.name AS order_name, o.phone, o.province, o.district, o.commune, o.detailedAddress, "
                + "u.id AS user_id, u.fullName AS user_name, u.email AS user_email, "
                + "s.id AS status_id, s.name AS status_name "
                + "FROM Orders o "
                + "JOIN Users u ON o.userId = u.id "
                + "JOIN Status s ON o.statusId = s.id "
                + "ORDER BY order_id DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("user_name"));
                user.setEmail(rs.getString("user_email"));
                // Add other fields as necessary

                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setStatus(rs.getString("status_name"));
                // Add other fields as necessary

                Order order = new Order();
                order.setId(rs.getInt("order_id"));
                order.setUserId(user);
                order.setDate(rs.getTimestamp("orderDate"));
                order.setStatusid(status);
                order.setTotal(rs.getDouble("total"));
                order.setName(rs.getString("order_name"));
                order.setPhone(rs.getString("phone"));
                order.setProvince(rs.getString("province"));
                order.setDistrict(rs.getString("district"));
                order.setCommune(rs.getString("commune"));
                order.setDetailedAddress(rs.getString("detailedAddress"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<Status> getAllStatus() {
        List<Status> statuses = new ArrayList<>();
        String sql = "SELECT * FROM Status";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Status status = new Status();
                status.setId(rs.getInt("id"));
                status.setStatus(rs.getString("name"));
                statuses.add(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statuses;
    }

    public void updateOrderStatus(int orderId, int statusId) {
        String sql = "UPDATE Orders SET statusId = ? WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, statusId);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int findLastOrderId(int userId) {
        String sql = "SELECT TOP 1 id FROM Orders WHERE userId = ? ORDER BY id DESC";
        int lastOrderId = -1;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                lastOrderId = resultSet.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lastOrderId;
    }

    public List<Order> selectAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT orderDate, total FROM Orders ORDER BY orderDate";

        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setDate(rs.getTimestamp("orderDate"));
                order.setTotal(rs.getDouble("total"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Order> selectOrdersByDateRange(Date startDate, Date endDate) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT CONVERT(date, orderDate) AS orderDate, SUM(total) AS total \n"
                    + "FROM Orders  \n"
                    + "GROUP BY CONVERT(date, orderDate) \n"
                    + "ORDER BY orderDate;";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setDate(rs.getTimestamp("orderDate"));
                    order.setTotal(rs.getDouble("total"));
                    list.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateStockCancelOrder(int orderId) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean success = false;

        try {
            // Step 1: Retrieve order details
            String getOrderDetailsQuery = "SELECT variantId, quantity FROM OrderDetail WHERE oid = ?";
            ps = connection.prepareStatement(getOrderDetailsQuery);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            // Store the product variant ID and quantities to update stock
            Map<Integer, Integer> productVariants = new HashMap<>();
            while (rs.next()) {
                int variantId = rs.getInt("variantId");
                int quantity = rs.getInt("quantity");
                productVariants.put(variantId, quantity);
            }
            rs.close();
            ps.close();

            // Step 2: Update stock quantities
            String updateStockQuery = "UPDATE ProductVariant SET stock = stock + ? WHERE id = ?";
            ps = connection.prepareStatement(updateStockQuery);
            for (Map.Entry<Integer, Integer> entry : productVariants.entrySet()) {
                ps.setInt(1, entry.getValue());
                ps.setInt(2, entry.getKey());
                ps.executeUpdate();
            }

            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
            success = false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }
   public int getTotalOrdersByStatusId(int statusId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Orders WHERE statusId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, statusId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
            return 0;
        }
    }
    
    
    public static void main(String[] args) throws SQLException {
        OrderDao orderDAO = new OrderDao();
        int statusid = 2;
        int total = orderDAO.getTotalOrdersByStatusId(statusid);
        System.out.println(total);
    }
}
