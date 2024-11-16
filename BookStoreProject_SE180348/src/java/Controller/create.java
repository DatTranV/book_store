package Controller;

import User.UserDAO;
import User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Banme.com
 */
@WebServlet(name = "create", urlPatterns = {"/create"})
public class create extends HttpServlet {

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
          String userID = request.getParameter("userid");
      String fullName = request.getParameter("fullname"); 
    
    String passParam = request.getParameter("pass");
    int pass = Integer.parseInt(passParam);
   


     String repassParam = request.getParameter("repass");
    int repass = Integer.parseInt(passParam);
      
      //DAO 
        UserDAO dao = new UserDAO(); 
      // UserDTO
       UserDTO user = new UserDTO();


       boolean check = false;
       // create messgae 
       String[] messageUserID = {"least 1 Character Upercase ", "least 1 Number","Minimum length of 5 characters"}; 
       String messagePassword;
       String messageID;
       // Create String Url
       String url ="";
       if(!userID.isEmpty() &&  !fullName.isEmpty() && !passParam.isEmpty() && !repassParam.isEmpty()) {
          if(dao.getDuplicateID(userID)) {
              url="signup.jsp";
                messageID = "UserID have already exsits";
               request.setAttribute("messageID", messageID);
              request.getRequestDispatcher(url).forward(request, response);
              check =false;
          }else if (!checkUserId(userID)) {
              request.setAttribute("messageUserID", messageUserID); 
           
              check =false;
          }
 
          else if  (pass!=repass) {
               messagePassword = "Dont Match Password , enter Again ! ";
               request.setAttribute("messagePassword", messagePassword);
              check = false;
          }else {
              check  =true;
          }
          
       }
       // chuyển hướng trang 
       if(check){
              
              user = new UserDTO(userID, pass, fullName, 0);
              if(dao.create(user)) {
                  url="login.jsp"; 
                  
              }
          }else {
              url ="signup.jsp";
          }
       request.getRequestDispatcher(url).forward(request, response);
    }
    
    boolean checkUserId(String userID) {
       
        Pattern p  = Pattern.compile("^[a-z0-9]{2,}$"); 
        Matcher M = p.matcher(userID); 
        if(M.find()){
            return true;
        }else {
         return false;
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
