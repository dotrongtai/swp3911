package Controller;

import Dal.AccountDao;
import Model.User;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("acc") == null) {
                response.sendRedirect("login.jsp");
            } else {
                User user = (User) session.getAttribute("acc");
                int id = user.getId();
                AccountDao ad = new AccountDao();
                User u = ad.GetAccountById(id);
                request.setAttribute("user", u);
                request.setAttribute("messprofile", session.getAttribute("messprofile"));
                request.setAttribute("messprofile", session.getAttribute("messDoneChangePassword"));
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, e);
            session.setAttribute("messprofile", "Có lỗi xảy ra khi tải trang vui lòng thử lại.");
            response.sendRedirect("profile");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            User acc = (User) session.getAttribute("acc");

            if (acc != null) {
                String fullName = request.getParameter("fullName");
                String gender = request.getParameter("gender");
                String dob = request.getParameter("dob");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                
                if (fullName == null || fullName.trim().isEmpty()) {
                    session.setAttribute("messprofile", "Họ và tên không được để trống.");
                    response.sendRedirect("profile");
                    return;
                }
                if(address == null || address.trim().isEmpty()){
                    session.setAttribute("messprofile", "Địa chỉ không được để trống.");
                    response.sendRedirect("profile");
                    return;
                }
                Date dateOfBirth = null;
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    dateOfBirth = dateFormat.parse(dob);
                    Date currentDate = new Date();
                    if (dateOfBirth.after(currentDate)) {
                        session.setAttribute("messprofile", "Ngày sinh phải trước ngày hiện tại.");
                        response.sendRedirect("profile");
                        return;
                    }
                } catch (ParseException e) {
                    session.setAttribute("messprofile", "Vui lòng sử dụng định dạng yyyy-MM-dd.");
                    response.sendRedirect("profile");
                    return;
                }
                
                if (!phone.matches("0\\d{9}")) {
                    session.setAttribute("messprofile", "Vui lòng nhập số điện thoại có 10 số và bắt đầu bằng số 0.");
                    response.sendRedirect("profile");
                    return;
                }

                int id = acc.getId();
                AccountDao ad = new AccountDao();
                ad.UpdateProfileById(id, fullName, phone, address, dateOfBirth, gender);
                User u = ad.GetAccountById(id);
                session.setAttribute("messprofile", "Lưu thành công!");
                session.setAttribute("acc", u);
                response.sendRedirect("profile");
               
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, e);
            session.setAttribute("messprofile", "Có lỗi xảy ra khi cập nhật thông tin vui lòng thử lại.");
            response.sendRedirect("profile");
        }
    }

    @Override
    public String getServletInfo() {
        return "ProfileServlet for user profile management";
    }
}
