/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TRONG TAI
 */
public class CategoryDao extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category a = new Category();
                a.setId(rs.getInt(1));
                a.setName(rs.getString(2));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public Category getCategoryById(int id) {
        Category category = null;
        try {
            String sql = "Select * from Category WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return category;
    }

    public void insertCategory(String name) {
        String query = "INSERT INTO [dbo].[Category]\n"
                + "           ([name])\n"
                + "     VALUES (?)";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, name);
            ps.executeUpdate();
            System.out.println("Category inserted successfully.");
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
        }
    }

    public void UpdateCategory(int cid, String name) {
        String sql = "UPDATE [dbo].[Category]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, cid);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String deleteCategory(int cid) {
        String checkSql = "SELECT COUNT(*) FROM [dbo].[Product] WHERE cid = ?";
        String deleteSql = "DELETE FROM [dbo].[Category] WHERE id = ?";
        String message = "";

        try {
            // Check for associated products
PreparedStatement checkSt = connection.prepareStatement(checkSql);
            checkSt.setInt(1, cid);
            ResultSet rs = checkSt.executeQuery();

            if (rs.next()) {
                int productCount = rs.getInt(1);
                if (productCount > 0) {
                    message = "Không thể xóa danh mục này. Có " + productCount + " sản phẩm được liên kết với danh mục này. Vui lòng xóa hoặc chỉ định lại các sản phẩm này trước khi xóa danh mục.";
                    return message;
                }
            }

            // Proceed with deleting the category
            PreparedStatement deleteSt = connection.prepareStatement(deleteSql);
            deleteSt.setInt(1, cid);
            deleteSt.executeUpdate();
            message = "Xóa danh mục thành công.";

        } catch (SQLException e) {
            message = "SQL Error: " + e.getMessage();
        }
        return message;
    }
    public List<Category> getCategoryCounts() throws Exception {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, COUNT(p.id) AS count " +
                     "FROM Category c LEFT JOIN Product p ON c.id = p.cid " +
                     "GROUP BY c.id, c.name";

        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int count = rs.getInt("count");
                list.add(new Category(id, name, count));
            }
        } catch (SQLException e) {
            throw new Exception("Error retrieving category counts", e);
        }

        return list;
    }
public int getTotalCategory(){
    int count = 0;
    String sql = "SELECT COUNT(*) FROM Category";
    try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (SQLException e) {
        System.out.println("SQL Error: " + e.getMessage());
    }
    return count;
}
    public static void main(String[] args) {

        CategoryDao cd = new CategoryDao();
         int total = cd.getTotalCategory();
        System.out.println(total);
    }
}