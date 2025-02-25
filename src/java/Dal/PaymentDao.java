/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Payment;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class PaymentDao extends DBContext {

    
    public void insertPayment(int oid, int type, Date date, int amount) {
        String sql = "INSERT INTO Payment (oid, type, date, amount) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            st.setInt(2, type);
            st.setDate(3, date);
            st.setInt(4, amount); // Use setInt for the 'int' type in SQL
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public Integer getPaymentTypeByOrderId(int orderId) {
        String sql = "SELECT type FROM Payment WHERE oid = ?";
        Integer paymentType = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    paymentType = rs.getInt("type");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return paymentType;
    }

//    public static void main(String[] args) {
//        // Create a new payment object
//        Payment payment = new Payment();
//        payment.setOid(2);
//        payment.setType(1); // 1 for online, 2 for cash
//        payment.setDate(new Date(System.currentTimeMillis()));
//        payment.setAmount(199999);
//
//        // Create an instance of the PaymentDao and insert the payment
//        PaymentDao paymentDao = new PaymentDao();
//        paymentDao.insertPayment(payment);
//
//        System.out.println("Payment inserted successfully!");
//    }

}
