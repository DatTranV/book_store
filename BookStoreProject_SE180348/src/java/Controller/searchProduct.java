package ProductController;

import Books.BooksDAO;
import Books.BooksDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Banme.com
 */
@WebServlet(name = "searchProduct", urlPatterns = {"/searchProduct"})
public class searchProduct extends HttpServlet {

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
          String  searchType = request.getParameter("searchType");
       String  search = request.getParameter("search");
       
       // dao 
        BooksDAO dao = new  BooksDAO(); 
       // create list moi
       List<BooksDTO>  list = null;
       // create URL  
       String URL = "";
       String message = "";
       
       if(searchType.equals("author")) {

           list = dao.getSearchBooksBy_AUTHOR(search); 
           if (!list.isEmpty()) {
               URL = "shopall.jsp";
              
           }else{ 
              URL ="shopall.jsp";
              message = "Dont Found Any Thing !"; 
           }
       }else{
           list = dao.getSearchBooksBy_NAME(search); 
           if(!list.isEmpty()) {
                URL = "shopall.jsp";
               request.setAttribute("list",list);
           }else{ 
              URL ="shopall.jsp";
              message = "Dont Found Any Thing !"; 
           }
       }
       
       request.setAttribute("list", list);
       request.setAttribute("message", message);
       request.getRequestDispatcher(URL).forward(request, response);
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
