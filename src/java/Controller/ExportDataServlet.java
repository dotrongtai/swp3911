/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dal.BrandDao;
import Dal.CategoryDao;
import Dal.OrderDao;
import Model.Brand;
import Model.Category;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ExportDataServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ExportDataServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportDataServlet at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/csv; charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"statistics.csv\"");

        PrintWriter writer = response.getWriter();

        try {
            // Retrieve data
            List<Brand> listBrands = new BrandDao().getBrandCounts();
            List<Category> listCategories = new CategoryDao().getCategoryCounts();
            List<Order> listOrders = new OrderDao().selectAllOrders(); // Assuming this method exists in OrderDao

            // Write CSV header
            writer.println("Type,Name,Count/Date,Paid,Unpaid");

            // Write brand data
            for (Brand brand : listBrands) {
                writer.println("Brand," + brand.getName() + "," + brand.getCount() + ",,");
            }

            // Write category data
            for (Category category : listCategories) {
                writer.println("Category," + category.getName() + "," + category.getCount() + ",,");
            }

            // Write order data
            writer.println("Date,Total");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            for (Order order : listOrders) {
                writer.println(dateFormat.format(order.getDate()) + "," + order.getTotal());
            }

        } catch (Exception e) {
            writer.println("Error retrieving data: " + e.getMessage());
        } finally {
            writer.flush();
            writer.close();
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
