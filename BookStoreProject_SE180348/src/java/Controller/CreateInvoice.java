package Controller;

import Invoice.InvoiceDAO;
import Invoice.InvoiceDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Banme.com
 */
@WebServlet(name = "CreateInvoice", urlPatterns = {"/CreateInvoice"})
public class CreateInvoice extends HttpServlet {
       private static final String ERROR="checkout.jsp";
    private static final String SUCCESS="thankyou.jsp";
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
InvoiceDAO dao = new InvoiceDAO();

try {
    // Retrieve parameters from request
    String invId = request.getParameter("invId");
    String userID = request.getParameter("userID");
    String dateBuy = request.getParameter("dateBuy");
    String gmail = request.getParameter("gmail");
    String address = request.getParameter("address");
    float total = Float.parseFloat(request.getParameter("total"));

    // Validate inputs
    if (invId != null && !invId.isEmpty() &&
        userID != null && !userID.isEmpty() &&
        gmail != null && !gmail.isEmpty() &&
        address != null && !address.isEmpty() &&
        total > 0) {

        // Format dateBuy if it's null or empty
        if (dateBuy == null || dateBuy.isEmpty()) {
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            dateBuy = formatter.format(date);
        }

        // Create InvoiceDTO object
        InvoiceDTO invoice = new InvoiceDTO(invId, userID, dateBuy, gmail, address, total);

        // Attempt to insert into database
        boolean checkInsert = dao.createInvoice(invoice);

        if (checkInsert) {
            url = SUCCESS;
        } else {
            url = ERROR; // Handle insertion failure case if needed
            log("Failed to insert invoice into database."); // Log insertion failure
        }
    } else {
        url = ERROR; // Handle validation failure (required fields not provided or total <= 0)
        log("Invalid or missing parameters."); // Log validation failure
    }

} catch (NumberFormatException e) {
    // Handle number format exception (e.g., total parsing error)
    log("Error parsing total: " + e.getMessage());
} catch (SQLException e) {
    // Handle SQL exception (database interaction error)
    log("SQL Exception: " + e.getMessage());
} catch (Exception e) {
    // Handle any other unexpected exceptions
    log("Unexpected Exception: " + e.getMessage());
} finally {
    // Forward to appropriate URL based on result
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
