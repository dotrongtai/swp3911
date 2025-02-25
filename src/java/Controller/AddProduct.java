/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.BrandDao;
import Dal.CategoryDao;
import Dal.ProductDao;
import Model.Brand;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TRONG TAI
 */
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        CategoryDao cdao = new CategoryDao();
        List<Category> category = cdao.getAllCategory();
        request.setAttribute("category", category);

        BrandDao bdao = new BrandDao();
        List<Brand> brand = bdao.getAllBrand();
        request.setAttribute("brand", brand);

        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve parameters
    String categoryStr = request.getParameter("category");
    String brandStr = request.getParameter("brand");
    String name = request.getParameter("name");
    String image = request.getParameter("image");
    String description = request.getParameter("description");
    String chip = request.getParameter("chip");
    String ram = request.getParameter("ram");
    String rom = request.getParameter("rom");
    String gpu = request.getParameter("gpu");
    String priceStr = request.getParameter("price");
    String stockStr = request.getParameter("stock");

    // Initialize a list to store error messages
    List<String> errors = new ArrayList<>();

    // Validate parameters
    if (name == null || name.trim().isEmpty() || !name.matches("[a-zA-Z0-9 ]+")) {
        errors.add("Tên sản phẩm không hợp lệ.");
    }
    if (image == null || image.trim().isEmpty() ) {
        errors.add("Hình ảnh không hợp lệ.");
    }
    if (description == null || description.trim().isEmpty()) {
        errors.add("Mô tả không hợp lệ.");
    }
    if (priceStr == null || priceStr.trim().isEmpty()) {
        errors.add("Giá sản phẩm không được để trống.");
    } else {
        try {
            int price = Integer.parseInt(priceStr);
            if (price < 0) {
                errors.add("Giá sản phẩm không được âm.");
            }
        } catch (NumberFormatException e) {
            errors.add("Giá sản phẩm phải là số.");
        }
    }

    // Check if there are any errors
    if (!errors.isEmpty()) {
        // Store errors in session
        HttpSession session = request.getSession();
        session.setAttribute("errors", errors);

        // Redirect back to the form page
        response.sendRedirect("addproduct");
        return;
    }

    // Convert numerical parameters
    int cid = Integer.parseInt(categoryStr);
    int bid = Integer.parseInt(brandStr);
    int price = Integer.parseInt(priceStr);
    int stock = Integer.parseInt(stockStr);
    int isHidden = 0;
    
    // Add the product
    ProductDao pdao = new ProductDao();
    pdao.addProduct(name, image, price, description, stock, cid, bid, chip, ram, rom, gpu, isHidden);
    response.sendRedirect("manageproduct");
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