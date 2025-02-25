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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class StatisticServlet extends HttpServlet {
   
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
            out.println("<title>Servlet StatisticServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticServlet at " + request.getContextPath () + "</h1>");
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
        List<Category> listCategories = null;
        try {
            listCategories = new CategoryDao().getCategoryCounts();
        } catch (Exception ex) {
            Logger.getLogger(StatisticServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            request.setAttribute("listCategories", listCategories);

            List<Brand> listBrands = null;
        try {
            listBrands = new BrandDao().getBrandCounts();
        } catch (Exception ex) {
            Logger.getLogger(StatisticServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            request.setAttribute("listBrands", listBrands);

            List<Order> listOrders = new OrderDao().selectAllOrders();
            request.setAttribute("listOrders", listOrders);

            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = null;
        try {
            startDate = startDateStr != null ? sdf.parse(startDateStr) : new Date();
        } catch (ParseException ex) {
            Logger.getLogger(StatisticServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            Date endDate = null;
        try {
            endDate = endDateStr != null ? sdf.parse(endDateStr) : new Date();
        } catch (ParseException ex) {
            Logger.getLogger(StatisticServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

            List<Order> listOrder = new OrderDao().selectOrdersByDateRange(startDate, endDate);
            request.setAttribute("listOrder", listOrder);

            // Forward to statistic.jsp for rendering
            request.getRequestDispatcher("statistic.jsp").forward(request, response);
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
