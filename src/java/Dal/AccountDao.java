/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author ADMIN
 */
public class AccountDao extends DBContext {

    public User GetAccount(String gmail, String pass) {

        String sql = "select * from [dbo].[Users] where email=? and pass=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gmail);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setPass(rs.getString("pass"));
                a.setFullName(rs.getString("fullName"));
                a.setGender(rs.getString("gender"));
                a.setDob(rs.getDate("dob"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setRoleId(rs.getInt("roleId"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkAccountByEmail(String email) {
        String sql = "SELECT * FROM [dbo].[Users] WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPass(rs.getString("pass"));
                user.setFullName(rs.getString("fullName"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRoleId(rs.getInt("roleId"));
                user.setGender(rs.getString("gender"));
                user.setDob(rs.getDate("dob"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            // Log the exception or handle it appropriately
        }
        return null;
    }

    public void UpdatePassword(String email, String pass) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [pass] = ?\n"
                + " WHERE email = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertUser(String email, String pass, String fullName, String phone, String address, int roleId, String gender, java.util.Date dob) {
        String query = "INSERT INTO [dbo].[Users] (email, pass, fullName, phone, address, roleId, gender, dob) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, pass);
            ps.setString(3, fullName);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setInt(6, roleId);
            ps.setString(7, gender);
            ps.setDate(8, new java.sql.Date(dob.getTime())); // Chuyển đổi java.util.Date sang java.sql.Date
            ps.executeUpdate();
            System.out.println("User inserted successfully.");
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
        }
    }

    public List<User> getAllAccount() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";  // Corrected table name
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setPass(rs.getString("pass"));
                a.setFullName(rs.getString("fullName"));
                a.setGender(rs.getString("gender"));
                a.setDob(rs.getDate("dob"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setRoleId(rs.getInt("roleId"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User GetAccountById(int id) {

        String sql = "select * from [dbo].[Users] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setPass(rs.getString("pass"));
                a.setFullName(rs.getString("fullName"));
                a.setGender(rs.getString("gender"));
                a.setDob(rs.getDate("dob"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                a.setRoleId(rs.getInt("roleId"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateAccountById(int id, String email, String fullName, String phone, String address, String gender, Date dateOfBirth) {
        String sql = "UPDATE Users\n"
                + "SET email = ?, fullName = ?, phone = ?, address = ?, gender = ?, dateOfBirth = ?\n"
                + "WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, fullName);
            st.setString(3, phone);
            st.setString(4, address);
            st.setString(5, gender);
            st.setDate(6, dateOfBirth);
            st.setInt(7, id);
            st.executeUpdate();

            System.out.println("Account updated successfully.");

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            // Log the exception or handle it appropriately
        }
    }

    public void updateRoleById(int id, int role) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [roleId] = ?\n"
                + " WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, role);
            st.setInt(2, id);
            st.executeUpdate();

            System.out.println("Role updated successfully.");

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            // Log the exception or handle it appropriately
        }
    }

    public void deleteUserWithOrders(int uid) {
        String deletePaymentsSQL = "DELETE FROM Payment WHERE oid IN (SELECT id FROM [Order] WHERE userId = ?)";
        String deleteOrderDetailsSQL = "DELETE FROM OrderDetail WHERE oid IN (SELECT id FROM [Order] WHERE userId = ?)";
        String deleteOrdersSQL = "DELETE FROM [Order] WHERE userId = ?";
        String deleteFeedbackSQL = "DELETE FROM Feedback WHERE userId = ?";
        String deleteCartSQL = "DELETE FROM Cart WHERE userId = ?";
        String deleteUserSQL = "DELETE FROM Users WHERE id = ?";
        try {
            // Start transaction
            connection.setAutoCommit(false);

            // Delete payments
            PreparedStatement stPayments = connection.prepareStatement(deletePaymentsSQL);
            stPayments.setInt(1, uid);
            stPayments.executeUpdate();

            // Delete order details
            PreparedStatement stOrderDetails = connection.prepareStatement(deleteOrderDetailsSQL);
            stOrderDetails.setInt(1, uid);
            stOrderDetails.executeUpdate();

            // Delete orders
            PreparedStatement stOrders = connection.prepareStatement(deleteOrdersSQL);
            stOrders.setInt(1, uid);
            stOrders.executeUpdate();

            // Delete feedback
            PreparedStatement stFeedback = connection.prepareStatement(deleteFeedbackSQL);
            stFeedback.setInt(1, uid);
            stFeedback.executeUpdate();

            // Delete cart
            PreparedStatement stCart = connection.prepareStatement(deleteCartSQL);
            stCart.setInt(1, uid);
            stCart.executeUpdate();

            // Delete user
            PreparedStatement stUser = connection.prepareStatement(deleteUserSQL);
            stUser.setInt(1, uid);
            stUser.executeUpdate();

            // Commit transaction
            connection.commit();

        } catch (SQLException e) {
            System.out.println(e);
            try {
                // Rollback transaction if something goes wrong
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println(rollbackEx);
            }
        } finally {
            try {
                // Set auto-commit back to true
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
    }

    public void UpdateProfileById(int id, String fullName, String phone, String address, java.util.Date dob, String gender) {
        String sql = "UPDATE [dbo].[Users] SET [fullName] = ?, [phone] = ?, [address] = ?, [dob] = ?, [gender] = ? WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, phone);
            st.setString(3, address);
            st.setDate(4, new java.sql.Date(dob.getTime()));
            st.setString(5, gender);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void ChangePasswordById(int id, String pass) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [pass] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateAccountById(int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [email] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[fullName] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[roleId] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[dob] = ?\n"
                + " WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
public int getTotalUser(){
    int count = 0;
    String sql ="SELECT COUNT(*) FROM Users";
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
        AccountDao ac = new AccountDao();
        int total = ac.getTotalUser();
        System.out.println("Total : " + total);
    }
}
