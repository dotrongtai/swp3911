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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDao ad = new AccountDao();

        // Check if the account exists based on email
        User u1 = ad.checkAccountByEmail(email);

        if (u1 == null) {
            // No account found with the provided email
            request.setAttribute("mess", "Tài khoản của bạn chưa tồn tại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Account exists, now check password
            User u = ad.GetAccount(email, password);

            if (u == null || !u.getPass().equals(password)) {
                // Password does not match
                request.setAttribute("mess", "Bạn nhập không đúng mật khẩu");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Password matches, proceed with successful login
                HttpSession session = request.getSession();
                session.setAttribute("acc", u);

                switch (u.getRoleId()) {
                    case 1:
                        response.sendRedirect("homeadmin");
                        break;
                        case 3:
                        response.sendRedirect("homestaff");
                        break;
                    case 4:
                        request.setAttribute("mess", "Tài khoản của bạn đã bị khóa do vi phạm quy định của Web");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                    default:
                        response.sendRedirect("home");
                        break;
                }
            }
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
