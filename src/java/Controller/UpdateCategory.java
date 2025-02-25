/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.CategoryDao;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateCategory", urlPatterns = {"/updatecategory"})
public class UpdateCategory extends HttpServlet {

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
            out.println("<title>Servlet UpdateCategory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCategory at " + request.getContextPath() + "</h1>");
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
        CategoryDao cd = new CategoryDao();
        Category c = cd.getCategoryById(id);
        request.setAttribute("category", c);
        request.getRequestDispatcher("updateCategory.jsp").forward(request, response);
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
        int cid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("name").trim(); // Loại bỏ khoảng trắng ở đầu và cuối
        CategoryDao bd = new CategoryDao();
        String message = "";
        String regex = "^[a-zA-Z0-9\\s]+$"; // Only allows letters, numbers, and spaces

        if (name.isEmpty()) {
            message = "Tên loại sản phẩm không được để trống hoặc chỉ chứa khoảng trắng. Vui lòng nhập chữ.";
            request.setAttribute("message", message);
            List<Category> listCategory = bd.getAllCategory();
            request.setAttribute("listCategory", listCategory); // Send the existing list back to the JSP
            request.getRequestDispatcher("categoryManagerment.jsp").forward(request, response);
            return;
        }


        List<Category> listCategory = bd.getAllCategory();

        // Check if the category name already exists
        for (Category category : listCategory) {
            if (category.getName().equalsIgnoreCase(name) && category.getId() != cid) {
                message = "Chỉnh sửa không thành công, tên loại sản phẩm này đã có trong danh sách";
                request.setAttribute("message", message);
                request.setAttribute("listCategory", listCategory); // Send the existing list back to the JSP
                request.getRequestDispatcher("categoryManagerment.jsp").forward(request, response);
                return;
            }
        }

        // Update the category if no duplicate found
        bd.UpdateCategory(cid, name);
        message = "Cập nhật loại sản phẩm thành công.";

        // Get updated list of categories and forward to JSP
        List<Category> listCategor1 = bd.getAllCategory();
        request.setAttribute("listCategory", listCategor1);
        request.setAttribute("message", message);
        request.getRequestDispatcher("categoryManagerment.jsp").forward(request, response);
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
