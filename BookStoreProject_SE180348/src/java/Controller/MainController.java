package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Banme.com
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final String ERROR = "home.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "login";
    private static final String SEARCH_PRODUCT = "search";
    private static final String SEARCH_PRODUCT_CONTROLLER = "searchProduct";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "logout";
    private static final String CREATE_PRODUCT = "createproduct";
    private static final String CREATE_PRODUCT_CONTROLLER = "createProduct";
    private static final String WISHLIST = "wishList";
    private static final String WISHLIST_CONTROLLER = "addWishList";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "removeProduct";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "updateProduct";
     private static final String ADDTOCART = "Add to Cart";
     private static final String ADD_TO_CART_CONTROLLER = "addToCart";
      private static final String CHANGECART = "CHANGE";
     private static final String CHANGECART_CONTROLLER = "change";
     private static final String SEARCH_PRICE = "Search";
     private static final String SEARCH_PRICE_CONTROLLER = "searchByPrice";
         private static final String CreateInvoice="createinvoice";
    private static final String CreateInvoice_CONTROLLER="CreateInvoice";
       private static final String UPDATE_USER = "updateuser";
    private static final String UPDATE_USER_CONTROLLER = "updateUser";
     private static final String SEARCH_USER = "searchuser";
    private static final String SEARCH_USER_CONTROLLER = "searchUser";

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
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (CREATE_PRODUCT.equals(action)) {
                url = CREATE_PRODUCT_CONTROLLER;
            } else if (WISHLIST.equals(action)) {
                url = WISHLIST_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            }else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            }else if (ADDTOCART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            }else if (CHANGECART.equals(action)) {
                url = CHANGECART_CONTROLLER;
            }else if (SEARCH_PRICE.equals(action)) {
                url = SEARCH_PRICE_CONTROLLER;
            }
             else if (CreateInvoice.equals(action)) {
                url = CreateInvoice_CONTROLLER;
            }
             else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            }
             else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            }
            else {
                request.setAttribute("ERROR", "Your action not support");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
