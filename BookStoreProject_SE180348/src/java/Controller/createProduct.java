package ProductController;

import Books.BooksDAO;
import Books.BooksDTO;

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
@WebServlet(name = "createProduct", urlPatterns = {"/createProduct"})
public class createProduct extends HttpServlet {

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
           String bookid = request.getParameter("bookid");
        String bookname = request.getParameter("bookname");
          String authorname = request.getParameter("authorname");
            String category = request.getParameter("category");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        float price = Float.parseFloat(request.getParameter("price")); 
           int discount = Integer.parseInt(request.getParameter("discount")); 
        int quantity = Integer.parseInt(request.getParameter("quantity")); 
        int notSale = Integer.parseInt(request.getParameter("notsale")); 
        BooksDTO books = new BooksDTO(bookid, bookname, authorname, category, description, image, price, discount, quantity, notSale);
        System.out.println(books.toString());
     
        // dao 
        BooksDAO dao  = new BooksDAO(); 
        //
        String url = "";
        String message = "";
        String message_DUPLICATE ="";
        boolean check = dao.CreateNewBooks(books);
        if(check) {
           
            url = "addproduct.jsp"; 
              message = "Add new product sucessfully ! ";
            
        }else{
            url ="addproduct.jsp";
            message = "Can't Add new product ! ";
            message_DUPLICATE = "Duplicate ID " + " mobileID";
        }
       request.setAttribute("message", message);
       request.setAttribute("message_DUPLICATE", message_DUPLICATE);
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
