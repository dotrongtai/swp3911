package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Dal.AccountDao;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author admin
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String passWord = request.getParameter("passWord");
        String confirmPass = request.getParameter("confirmPass");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");

        // Validate phone number format
        if (!isValidPhoneNumber(phone)) {
            request.setAttribute("err", "Số điện thoại không hợp lệ.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Validate date of birth format
        Date dateOfBirth = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = dateFormat.parse(dob);
        } catch (ParseException e) {
            System.out.println("Lỗi khi chuyển đổi ngày tháng: " + e.getMessage());
            request.setAttribute("err", "Ngày sinh không hợp lệ.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check age
        if (getAge(dateOfBirth) < 16) {
            request.setAttribute("err", "Người dùng phải đủ 16 tuổi.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Validate password format
        if (!passWord.matches("^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,16}$")) {
            request.setAttribute("err", "Mật khẩu phải có từ 8-16 ký tự và chứa ít nhất 1 chữ cái in hoa và 1 số.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!passWord.equals(confirmPass)) {
            request.setAttribute("err", "Mật khẩu và xác nhận mật khẩu phải giống nhau.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        AccountDao ad = new AccountDao();
        User user = ad.checkAccountByEmail(email);
        if (user == null) {
            HttpSession session = request.getSession();
            User u = new User(email, passWord, fullName, phone, address, roleId, gender, dateOfBirth);
            session.setAttribute("user", u);
            session.setAttribute("codeGenerationTime", System.currentTimeMillis());
        } else {
            request.setAttribute("err", "Tài khoản email đã tồn tại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Generate verification code
        String code = generateCode();

        // Send verification code via email
        try {
            sendEmail(email, code);
            // Store the code and email in session for later verification
            request.getSession().setAttribute("verificationCode", code);
            request.getSession().setAttribute("email", email);
            // Redirect to the verification page
            response.sendRedirect("verifyRegister.jsp");
        } catch (MessagingException e) {
            request.setAttribute("err", "Gửi email thất bại!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private boolean isValidPhoneNumber(String phone) {
        String regex = "^0[0-9]{9}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }

    private int getAge(Date dateOfBirth) {
        LocalDate birthDate = dateOfBirth.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate currentDate = LocalDate.now();
        return Period.between(birthDate, currentDate).getYears();
    }

    private String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    private void sendEmail(String to, String code) throws MessagingException, UnsupportedEncodingException {
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
        message.setSubject(MimeUtility.encodeText("Mã xác nhận ", "UTF-8", "B"));
        message.setContent("Mã xác nhận của bạn là: " + code, "text/plain; charset=UTF-8");

        Transport.send(message);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
