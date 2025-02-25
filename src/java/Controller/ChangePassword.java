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

/**
 *
 * @author ADMIN
 */
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        String pass = request.getParameter("pass");
        String newpass = request.getParameter("newpass");
        String comfirmnewpass = request.getParameter("comfirmnewpass");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");

        if (u == null) {
            response.sendRedirect("login.jsp");
        } else {
            String pass_1 = u.getPass();
            int id = u.getId();

            if (!pass_1.equals(pass)) {
                request.setAttribute("mess1", "Bạn nhập mật khẩu chưa đúng");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else if (newpass.equals(pass)) {
                request.setAttribute("mess1", "Mật khẩu mới không được trùng với mật khẩu cũ");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else if (!newpass.equals(comfirmnewpass)) {
                request.setAttribute("mess1", "Mật khẩu mới không khớp");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else if (!isValidPassword(newpass)) {
                request.setAttribute("mess1", "Mật khẩu mới phải có từ 8-16 kí tự và cần ít nhất 1 chữ cái in hoa và 1 số");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else {
                AccountDao ad = new AccountDao();
                ad.ChangePasswordById(id, newpass);
                session.setAttribute("messprofile", "Đổi mật khẩu thành công");
                response.sendRedirect("profile");
            }
        }
    }

    private boolean isValidPassword(String password) {
        // Password must be 8-16 characters long, have at least one uppercase letter and one number
        String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,16}$";
        return password.matches(passwordPattern);
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
