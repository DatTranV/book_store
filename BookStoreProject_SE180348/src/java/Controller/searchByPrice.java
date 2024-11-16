package ProductController;

import Books.BooksDAO;
import Books.BooksDTO;

import User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Banme.com
 */
@WebServlet(name = "searchByPrice", urlPatterns = {"/searchByPrice"})
public class searchByPrice extends HttpServlet {

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
        try {
            String fromPriceStr = request.getParameter("fromPrice");
            System.out.println(fromPriceStr);
            
            String toPriceStr = request.getParameter("toPrice");
            System.out.println(toPriceStr);

            if (fromPriceStr != null && toPriceStr != null && !fromPriceStr.isEmpty() && !toPriceStr.isEmpty()) {
                float fromPrice = Float.parseFloat(fromPriceStr);
                float toPrice = Float.parseFloat(toPriceStr);

                BooksDAO dao = new BooksDAO();
                List<BooksDTO> listProduct = dao.getListProductByPrice(fromPrice, toPrice);

                if (listProduct.isEmpty()) {
                    request.setAttribute("NO_RESULTS", "No search Results");
                } else {
                    request.setAttribute("list", listProduct);
                }
               
            }

        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
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
        processRequest(request, response);
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
