/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.AccountDao;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author admin
 */
public class VerifyRegister extends HttpServlet {

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
            out.println("<title>Servlet VerifyRegister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyRegister at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        // Lấy đối tượng User từ session
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String sentCode = (String) session.getAttribute("verificationCode");
        Long codeGenerationTime = (Long) session.getAttribute("codeGenerationTime");

        String inputCode = request.getParameter("code");
        String email = u.getEmail();
        String pass = u.getPass();
        String fullName = u.getFullName();
        String phone = u.getPhone();
        String address = u.getAddress();
        int roleId = u.getRoleId();
        String gender = u.getGender();
        Date dob = u.getDob();

        if (codeGenerationTime != null && System.currentTimeMillis() - codeGenerationTime <= 60000) { // 1 minute = 60000 milliseconds
            if (inputCode.equals(sentCode)) {
                AccountDao ad = new AccountDao();
                ad.insertUser(email, pass, fullName, phone, address, roleId, gender, dob);
                request.setAttribute("mess", "Đã tạo tài khoản thành công");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                // Xóa các biến session sau khi hoàn thành công việc
                session.removeAttribute("user");
                session.removeAttribute("verificationCode");
                session.removeAttribute("codeGenerationTime");
            } else {
                // Code is incorrect, show an error message
                request.setAttribute("error", "Mã xác nhận không đúng!");
                request.getRequestDispatcher("verify.jsp").forward(request, response);
            }
        } else {
            // Code expired, show an error message
            request.setAttribute("error", "Mã xác nhận đã hết hạn!");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }
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
