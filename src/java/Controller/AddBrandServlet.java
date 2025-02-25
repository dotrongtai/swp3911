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

/**
 *
 * @author ADMIN
 */
public class AddBrandServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBrandServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBrandServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        String nameBrand = request.getParameter("name");
        BrandDao bd = new BrandDao();
        List<Brand> listBrand = bd.getAllBrand();

        for (Brand brand : listBrand) {
            if (brand.getName().equalsIgnoreCase(nameBrand)) {
                request.setAttribute("mess", "Tên nhãn hàng này đã tồn tại!");
                request.getRequestDispatcher("addBrand.jsp").forward(request, response);
                return;
            }
        }
        
        if (nameBrand == null || nameBrand.trim().isEmpty()) {
            request.setAttribute("mess", "Hãy nhập tên nhãn hàng");
            request.getRequestDispatcher("addBrand.jsp").forward(request, response);
            return;
        }
        
        if (nameBrand.length() > 50) {
            request.setAttribute("mess", "Hãy nhập ít hơn 50 kí tự.");
            request.getRequestDispatcher("addBrand.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra ký tự đặc biệt và đảm bảo tên không chỉ chứa số
        if (nameBrand.matches(".*[^a-zA-Z0-9 ].*") || nameBrand.matches("\\d+")) {
            request.setAttribute("mess", "Tên nhãn hàng không được chứa ký tự đặc biệt và không được chỉ chứa số.");
            request.getRequestDispatcher("addBrand.jsp").forward(request, response);
            return;
        }
        
        bd.insertBrand(nameBrand);
        listBrand = bd.getAllBrand();
        request.setAttribute("messaddbrand", "Thêm nhãn hàng thành công");
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("brandManagerment.jsp").forward(request, response);

    } catch (Exception e) {
       
        e.printStackTrace(); 

        request.setAttribute("mess", "Wrong processing request.");
        request.getRequestDispatcher("addBrand.jsp").forward(request, response);
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
