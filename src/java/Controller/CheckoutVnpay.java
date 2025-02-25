/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.CartDao;
import Dal.OrderDao;
import Dal.PaymentDao;
import Dal.ProductDao;
import Model.Cart;
import Model.Order;
import Model.ProductVariant;
import Model.User;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeUtility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/**
 *
 * @author ADMIN
 */
public class CheckoutVnpay extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutVnpay</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutVnpay at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("result");
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("acc");

        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if (status.equalsIgnoreCase("00")) {
            CartDao cartDao = new CartDao();
            ProductDao productDao = new ProductDao();
            List<Cart> cartList = cartDao.getCartByUid(acc.getId());
            long total = cartDao.calculateTotalCartPrice(acc.getId());

            // Retrieve data from session
            String name = (String) session.getAttribute("fullname");
            String phone = (String) session.getAttribute("phone");
            String city = (String) session.getAttribute("city");
            String district = (String) session.getAttribute("district");
            String commune = (String) session.getAttribute("commune");
            String address = (String) session.getAttribute("address");

            LocalDateTime currentDate = LocalDateTime.now(); // Adjust to get current date/time properly
            OrderDao orderDao = new OrderDao(); // Correct variable name from 'od' to 'orderDao'

            // Handle cash on delivery payment
            Order order = new Order();
            order.setUserId(acc);
            order.setName(name);
            order.setPhone(phone);
            order.setProvince(city);
            order.setDistrict(district);
            order.setCommune(commune);
            order.setDetailedAddress(address);
            order.setDate(Date.from(currentDate.atZone(ZoneId.systemDefault()).toInstant()));
            order.setTotal(total);
            order.setStatusid(orderDao.getStatusById(1));

            // Add order details from cart items
            List<Model.OrderDetail> orderDetails = new ArrayList<>();
            for (Cart cart : cartList) {
                Model.OrderDetail detail = new Model.OrderDetail();
                detail.setPid(productDao.getProductById(cart.getPid()));
                detail.setNameProduct(cart.getName());
                ProductVariant variant = productDao.getProductVariantByID(cart.getVariantId());
                if (variant == null) {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Product variant not found for cart item.");
                    return;
                }
                detail.setVariantId(variant);
                detail.setPrice(cart.getPrice());
                detail.setQuantity(cart.getQuantity());
                detail.setTotal(cart.getTotalOneProduct());
                orderDetails.add(detail);
            }
            order.setOrderDetails(orderDetails);

            // Perform necessary updates and actions
            for (Cart cart : cartList) {
                productDao.updateProductQuantity(cart.getVariantId(), cart.getQuantity());
            }
            cartDao.clearCart(acc.getId());

            // Add the order to the database
            orderDao.addOrder(order);

            int oid = orderDao.findLastOrderId(acc.getId());
            Date date = orderDao.getOrderByOrderId(oid).getDate();

            PaymentDao paymentDao = new PaymentDao();
            paymentDao.insertPayment(oid, 2, (java.sql.Date) date, (int) total);

            try {
                sendEmail(acc.getEmail(), order, cartList);
            } catch (MessagingException | UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            // Remove specific session attributes
            session.removeAttribute("fullname");
            session.removeAttribute("phone");
            session.removeAttribute("city");
            session.removeAttribute("district");
            session.removeAttribute("commune");
            session.removeAttribute("address");

            response.sendRedirect("home");
        } else {
            response.sendRedirect("home");
        }

    }

    private void sendEmail(String to, Order order, List<Cart> cartList) throws MessagingException, UnsupportedEncodingException {
        final String username = "HoLaTechSE1803@gmail.com";
        final String password = "xgdm ytoa shxw iwdk";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.mime.charset", "UTF-8");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(MimeUtility.encodeText("Xác nhận đơn hàng", "UTF-8", "B"));

        // Create the email content
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("Cảm ơn bạn đã mua sắm tại HoLaTech!!!\n")
                .append("Đây là đơn hàng chi tiết của bạn:\n\n")
                .append("Tên người nhận: ").append(order.getName()).append("\n")
                .append("Số điện thoại: ").append(order.getPhone()).append("\n")
                .append("Địa chỉ: ").append(order.getDetailedAddress()).append(", ")
                .append(order.getCommune()).append(", ")
                .append(order.getDistrict()).append(", ")
                .append(order.getProvince()).append("\n")
                .append("Phương thức thanh toán: Đã thanh toán qua VNpay.\n\n");

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

        for (Model.OrderDetail detail : order.getOrderDetails()) {
            String productColor = "";
            for (Cart cart : cartList) {
                if (cart.getPid() == detail.getPid().getId() && cart.getVariantId() == detail.getVariantId().getId()) {
                    productColor = cart.getColorName();
                    break;
                }
            }
            emailContent.append("Tên sản phẩm: ").append(detail.getPid().getName())
                    .append("\nMàu sắc: ").append(productColor)
                    .append("\nSố lượng: ").append(detail.getQuantity())
                    .append("\nGiá: ").append(currencyFormatter.format(detail.getPrice()))
                    .append("\nTổng tiền của sản phẩm: ").append(currencyFormatter.format(detail.getTotal()))
                    .append("\n\n");
        }
        emailContent.append("Tổng tiền đơn hàng: ").append(currencyFormatter.format(order.getTotal())).append("\n\n");
        emailContent.append("Bạn sẽ sớm nhận được đơn hàng của mình.\n")
                .append("Chúng tôi mong rằng bạn sẽ có những trải nghiệm tuyệt vời khi mua sắm tại HoLaTech!!!!");

        message.setContent(emailContent.toString(), "text/plain; charset=UTF-8");

        Transport.send(message);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
