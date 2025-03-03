package Controller;

import User.UserDAO;
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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
       private static final String ADMIN_PAGE="home.jsp";
    private static final  String USER_PAGE  ="home.jsp";
    private static final  String ERROR  ="login.jsp";

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
        String url= ERROR;
        try {
            String userID= request.getParameter("username");
            String password= request.getParameter("password");
            System.out.println(userID);
            System.out.println(password);
            UserDAO dao= new UserDAO();
           
            UserDTO loginUser= dao.login(userID, password);

            if(loginUser!= null){
                HttpSession session= request.getSession();
                if (loginUser.getRoleId()==1 ||  loginUser.getRoleId()==2 ) {
                session.setAttribute("LOGIN_USER", loginUser);
            
                    url= ADMIN_PAGE;
                }else {
                    session.setAttribute("LOGIN_USER", loginUser);
                    
                    url = USER_PAGE;
                }
            }else{
                request.setAttribute("ERROR", "Incorrect userID or Password");
                url= ERROR;
            }
            
        } catch (Exception e) {
            log("Error at LoginController: "+ e.toString());
        }finally{
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
