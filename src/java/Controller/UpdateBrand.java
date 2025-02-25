/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.BrandDao;
import Model.Brand;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author ADMIN
 */
public class UpdateBrand extends HttpServlet {

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
            out.println("<title>Servlet UpdateBrand</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBrand at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        BrandDao bd = new BrandDao();
        Brand b = bd.getBrandById(id);
        request.setAttribute("brand", b);
        request.getRequestDispatcher("updateBrand.jsp").forward(request, response);
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
        int bid = Integer.parseInt(request.getParameter("bid"));
        String name = request.getParameter("name").trim();
        BrandDao bd = new BrandDao();
        String message = "";
        String regex = "^[a-zA-Z0-9\\s]+$";

        List<Brand> listBrand = bd.getAllBrand();

        // Check if the brand name already exists
        for (Brand brand : listBrand) {
            if (brand.getName().equalsIgnoreCase(name) && brand.getId() != bid) {
                message = "Chỉnh sửa không thành công , tên nhãn hàng này đã có trong danh sách";
                request.setAttribute("message", message);
                request.setAttribute("listBrand", listBrand); // Send the existing list back to the JSP
                request.getRequestDispatcher("brandManagerment.jsp").forward(request, response);
                return;
            }
            if (name.isEmpty()) {
                message = "Tên nhãn hàng không được để toàn bộ là dấu cách.";
                request.setAttribute("message", message);
                request.setAttribute("listBrand", listBrand);
                request.getRequestDispatcher("brandManagerment.jsp").forward(request, response);
                return;
            }
            if (!Pattern.matches(regex, name)) {
                message = "Tên nhãn hàng không được chứa kí tự đặc biệt.";
                request.setAttribute("message", message);
                request.setAttribute("listBrand", listBrand);
                request.getRequestDispatcher("brandManagerment.jsp").forward(request, response);
                return;
            }
        }

        // Update the brand if no duplicate found
        bd.UpdateBrand(bid, name);
        message = "Cập nhật nhãn hàng thành công.";

        // Get updated list of brands and forward to JSP
        List<Brand> listBrand1 = bd.getAllBrand();
        request.setAttribute("listBrand", listBrand1);
        request.setAttribute("message", message);
        request.getRequestDispatcher("brandManagerment.jsp").forward(request, response);
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
