package Controller;

import User.UserDTO;
import User.wishList.wishListDAO;
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
@WebServlet(name = "addWishList", urlPatterns = {"/addWishList"})
public class addWishList extends HttpServlet {

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
        String BooksID = request.getParameter("ID");
   
       HttpSession session = request.getSession();
       UserDTO  user  = (UserDTO )  session.getAttribute("LOGIN_USER");
       String userID  = user.getUserID();
       wishListDAO dao =new wishListDAO();
       // check exsist if was added  in wish list will return true
       boolean checkExsist = dao.exsist(BooksID);

        String url = "";
        String message = "";
        if (!checkExsist) {
            boolean valid = dao.Insert(userID, BooksID);
            if (valid) {
                url = "shopall.jsp";
                message = "Your product " + BooksID +" was added in wishlist.";
            }
        } else {
            url = "shopall.jsp";
        }
       request.setAttribute("message", message);
       request.getRequestDispatcher(url).forward(request, response);
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
