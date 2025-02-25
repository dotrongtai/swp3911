/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dal.ProductDao;
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
 * @author ADMIN
 */
public class AddQuantityProduct extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AddQuantityProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuantityProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ProductDao pd = new ProductDao();
    int id = Integer.parseInt(request.getParameter("id"));
    Product p = pd.getProductById(id);

    List color = pd.getAllColor();
    request.setAttribute("color", color);
    request.setAttribute("product", p);
    String errorMessage = (String) request.getAttribute("errorMessage");
    request.setAttribute("errorMessage", errorMessage); // Pass error message to JSP
    request.getRequestDispatcher("addQuantityProduct.jsp").forward(request, response);
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
    try {
        int id = Integer.parseInt(request.getParameter("productId"));
        int colorId = Integer.parseInt(request.getParameter("colorId"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        if (stock <= 0) {
            // Handle invalid input: stock must be positive
            request.setAttribute("errorMessage", "Số lượng phải lớn hơn 0");
            doGet(request, response); // Show the form with an error message
            return;
        }

        ProductDao pd = new ProductDao();
        pd.addOrUpdateProductVariant(id, colorId, stock);
        response.sendRedirect("manageproduct"); // Redirect to success page or another page

    } catch (NumberFormatException e) {
        // Handle invalid number format
        request.setAttribute("errorMessage", "Nhập số lượng không hợp lệ");
        doGet(request, response); // Show the form with an error message
    }
}


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}