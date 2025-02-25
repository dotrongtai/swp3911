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
import java.util.List;

/**
 *
 * @author TRONG TAI
 */
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet EditProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDao dao = new ProductDao();
        Product product = dao.getProductById(productId);
        request.setAttribute("product", product);
        CategoryDao cdao = new CategoryDao();
        List<Category> cl = cdao.getAllCategory();
        request.setAttribute("category", cl);
        BrandDao bdao = new BrandDao();
        List<Brand> list = bdao.getAllBrand();
        request.setAttribute("brand", list);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int category = Integer.parseInt(request.getParameter("categoryId"));
            int brand = Integer.parseInt(request.getParameter("brandId"));
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            String chip = request.getParameter("chip");
            String ram = request.getParameter("ram");
            String rom = request.getParameter("rom");
            String gpu = request.getParameter("gpu");
            int price = Integer.parseInt(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int productId = Integer.parseInt(request.getParameter("productId"));

            ProductDao pd = new ProductDao();
            pd.updateProduct(name, image, price, description, stock, brand, category, chip, ram, rom, gpu, productId);
            response.sendRedirect("manageproduct");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input data. Please ensure all fields are filled correctly.");
            doGet(request, response); // Redisplay the form with error message
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
