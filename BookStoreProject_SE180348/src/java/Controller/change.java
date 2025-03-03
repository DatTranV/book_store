package CartController;

import Cart.CartDAO;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "change", urlPatterns = {"/change"})
public class change extends HttpServlet {
  private static final String ERROR="cart.jsp";
    private static final String SUCCESS="cart.jsp";
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
        String url = ERROR;
        try {
            String cartId = request.getParameter("cartId");
            
            String quantityStr = request.getParameter("quantity");
           
            
                int newQuantity = Integer.parseInt(quantityStr); // Parse the quantity string
                CartDAO cartDAO = new CartDAO(); 
                Cart.CartDTO existingCart = cartDAO.getCartById(cartId);
                if (existingCart != null) { // Check if existingCart is not null
                    existingCart.setCartId(cartId);
                    existingCart.setQuantity(newQuantity);
                    
                    boolean check = cartDAO.updateCart(existingCart); // Use updateCart method
                    if (check) {
                        request.setAttribute("message", "Update of item in cart successfully.");
                        url = SUCCESS;
                    } else {
                        request.setAttribute("message", "Failed to update item.");
                    }
                }
            
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
