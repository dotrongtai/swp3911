package Dal;

import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDao extends DBContext {

    public List<Product> getTopSellingProducts() {
        List<Product> topSellingProducts = new ArrayList<>();

        String sql = "SELECT p.id AS pid, p.name, p.image, p.price, p.cid AS categoryId, "
                + "       c.name AS categoryName, tp.count, p.isHidden "
                + "FROM ( "
                + "    SELECT TOP 10 pid, COUNT(*) AS count "
                + "    FROM OrderDetail "
                + "    GROUP BY pid "
                + "    ORDER BY COUNT(*) DESC "
                + ") tp "
                + "JOIN Product p ON tp.pid = p.id "
                + "JOIN Category c ON p.cid = c.id "
                + "ORDER BY tp.count DESC";

        try (Connection conn = connection; PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("pid"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getInt("price"));
                product.setIsHidden(rs.getInt("isHidden"));

                Category category = new Category(rs.getInt("categoryId"), rs.getString("categoryName"));
                product.setCategory(category);

                // Add the product to the list
                topSellingProducts.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topSellingProducts;
    }

    public static void main(String[] args) {
        // Create an instance of OrderDetailDao
        OrderDetailDao orderDetailDao = new OrderDetailDao();
        
        // Retrieve top-selling products
        List<Product> topSellingProducts = orderDetailDao.getTopSellingProducts();

        // Print the results
        for (Product product : topSellingProducts) {
            System.out.println("Product ID: " + product.getId());
            System.out.println("Product Name: " + product.getName());
            System.out.println("Product Image: " + product.getImage());
            System.out.println("Product Price: " + product.getPrice());
            System.out.println("Category ID: " + product.getCategory().getId());
            System.out.println("Category Name: " + product.getCategory().getName());
            System.out.println("Is Hidden: " + product.getIsHidden());
            System.out.println("-----------------------------------");
        }
    }
}
