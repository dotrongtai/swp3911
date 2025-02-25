/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Cart;
import Model.Product;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CartDao extends DBContext {

    public int checkProductStock(int pid, int variantId) {
        String sql = "SELECT stock FROM ProductVariant WHERE pid = ? AND id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, pid);
            st.setInt(2, variantId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getCartQuantityByVariantId(int userId, int pid, int variantId) {
        String sql = "SELECT quantity FROM Cart WHERE userId = ? AND pid = ? AND variantId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, pid);
            st.setInt(3, variantId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
//
//    public void addToCart(User user, Product product, int quantity, int variantId) {
//        int currentQuantity = getCartQuantityByVariantId(user.getId(), product.getId(), variantId);
//        int stock = checkProductStock(product.getId(), variantId);
//
//        if (currentQuantity + quantity > stock) {
//            // Handle insufficient stock scenario (e.g., throw an exception or return an error)
//            throw new IllegalArgumentException("Not enough stock");
//        } else {
//            if (currentQuantity > 0) {
//                // Update existing item quantity
//                updateCartQuantity(user.getId(), product.getId(), variantId, currentQuantity + quantity);
//            } else {
//                // Insert new item
//                String sql = "INSERT INTO Cart (userId, pid, variantId, quantity) VALUES (?, ?, ?, ?)";
//                try (PreparedStatement st = connection.prepareStatement(sql)) {
//                    st.setInt(1, user.getId());
//                    st.setInt(2, product.getId());
//                    st.setInt(3, variantId);
//                    st.setInt(4, quantity);
//                    st.executeUpdate();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }

    public void addToCart(User user, Product product, int quantity, int variantId) {
        // SQL queries
        String checkIfExistsSql = "SELECT quantity, price FROM [dbo].[Cart] WHERE userId = ? AND pid = ? AND variantId = ?";
        String updateQuantityAndPriceSql = "UPDATE [dbo].[Cart] SET quantity = quantity + ?, price = price + ? WHERE userId = ? AND pid = ? AND variantId = ?";
        String insertNewProductSql = "INSERT INTO [dbo].[Cart] (userId, pid, quantity, price, variantId) VALUES (?, ?, ?, ?, ?)";

        try {
            // Check if the product already exists in the cart
            PreparedStatement checkIfExistsSt = connection.prepareStatement(checkIfExistsSql);
            checkIfExistsSt.setInt(1, user.getId());
            checkIfExistsSt.setInt(2, product.getId());
            checkIfExistsSt.setInt(3, variantId);
            ResultSet rs = checkIfExistsSt.executeQuery();

            if (rs.next()) {
                // Product already exists in the cart, update quantity and price
                int currentQuantity = rs.getInt("quantity");
                long currentPrice = rs.getLong("price");
                int updatedQuantity = currentQuantity + quantity;

                // Check stock for the product variant
                int stock = checkProductStock(product.getId(), variantId);

                if (updatedQuantity > stock) {
                    // Handle insufficient stock scenario
                    throw new IllegalArgumentException("Not enough stock available.");
                }

                // Update existing item quantity and price
                PreparedStatement updateSt = connection.prepareStatement(updateQuantityAndPriceSql);
                updateSt.setInt(1, quantity);
                updateSt.setLong(2, product.getPrice() * quantity);
                updateSt.setInt(3, user.getId());
                updateSt.setInt(4, product.getId());
                updateSt.setInt(5, variantId);
                updateSt.executeUpdate();
            } else {
                // Product does not exist in the cart, insert new product
                int stock = checkProductStock(product.getId(), variantId);

                if (quantity > stock) {
                    // Handle insufficient stock scenario
                    throw new IllegalArgumentException("Not enough stock available.");
                }

                PreparedStatement insertSt = connection.prepareStatement(insertNewProductSql);
                insertSt.setInt(1, user.getId());
                insertSt.setInt(2, product.getId());
                insertSt.setInt(3, quantity);
                insertSt.setLong(4, product.getPrice() * quantity);
                insertSt.setInt(5, variantId);
                insertSt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getCartByUid(int uid) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT c.id, c.userId, c.pid, c.variantId, c.quantity, c.price as totalOneProduct, "
                + "p.price as productPrice, p.image, p.name, co.id AS colorId, co.colorName, pv.stock AS pv_stock "
                + "FROM Cart c "
                + "JOIN Product p ON c.pid = p.id "
                + "JOIN ProductVariant pv ON c.variantId = pv.id "
                + "JOIN Color co ON pv.colorId = co.id "
                + "WHERE c.userId = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setId(rs.getInt("id"));
                c.setUserId(rs.getInt("userId"));
                c.setPid(rs.getInt("pid"));
                c.setVariantId(rs.getInt("variantId"));
                c.setQuantity(rs.getInt("quantity"));
                c.setTotalOneProduct(rs.getInt("totalOneProduct"));
                c.setPrice(rs.getInt("productPrice"));
                c.setImage(rs.getString("image"));
                c.setName(rs.getString("name"));
                // Set color information
                c.setColorId(rs.getInt("colorId"));
                c.setColorName(rs.getString("colorName"));
                c.setStockVariant(rs.getInt("pv_stock"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching cart items: " + e.getMessage());
        }
        return list;
    }

    public void deleteItemById(int cartId) {
        String deleteCartSql = "DELETE FROM [dbo].[Cart] WHERE id = ?";
        try {
            // Start a transaction
            connection.setAutoCommit(false);

            // Delete from ProductCart first
//            try (PreparedStatement st = connection.prepareStatement(deleteProductCartSql)) {
//                st.setInt(1, cartId);
//                st.executeUpdate();
//            }
            // Delete from Cart
            try (PreparedStatement st = connection.prepareStatement(deleteCartSql)) {
                st.setInt(1, cartId);
                st.executeUpdate();
            }

            // Commit transaction
            connection.commit();
        } catch (SQLException e) {
            System.out.println("Error deleting cart item: " + e.getMessage());
            try {
                // Rollback transaction if any error occurs
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println("Error rolling back transaction: " + rollbackEx.getMessage());
            }
        } finally {
            try {
                // Restore default auto-commit behavior
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                System.out.println("Error setting auto-commit back to true: " + ex.getMessage());
            }
        }
    }

    public long calculateTotalCartPrice(int userId) {
        String sql = "SELECT SUM(c.quantity * p.price) AS total "
                + "FROM Cart c JOIN Product p ON c.pid = p.id "
                + "WHERE c.userId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getLong("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void incrementQuantity(int id) {
        String sql = "UPDATE [dbo].[Cart] SET quantity = quantity + 1 WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);           // Product ID for price retrieval

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error incrementing quantity: " + e.getMessage());
        }
    }

    public void decrementQuantity(int id) {
        // If quantity is 1, remove the item
        String sql = "DELETE FROM [dbo].[Cart] WHERE id = ? AND quantity = 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                // If no rows were deleted, decrement quantity
                sql = "UPDATE [dbo].[Cart] SET quantity = quantity - 1 WHERE id =?";
                try (PreparedStatement st2 = connection.prepareStatement(sql)) {
                    st2.setInt(1, id);

                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Error decrementing quantity: " + e.getMessage());
        }
    }

    public void clearCart(int userId) {
        String query = "DELETE FROM Cart WHERE userId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCartQuantity(int userId, int pid, int variantId, int newQuantity) {
        String sql = "UPDATE Cart SET quantity = ? WHERE userId = ? AND pid = ? AND variantId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, newQuantity);
            st.setInt(2, userId);
            st.setInt(3, pid);
            st.setInt(4, variantId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDao cartDao = new CartDao();

        int productIdToTest = 2; // Replace with an actual product ID from your database
        int variantIdToTest = 94; // Replace with an actual variant ID from your database

        // Test checkProductStock
        System.out.println("Checking stock for product ID: " + productIdToTest + " and variant ID: " + variantIdToTest);
        int stock = cartDao.checkProductStock(productIdToTest, variantIdToTest);
        System.out.println("Available stock: " + stock);
    }
}
