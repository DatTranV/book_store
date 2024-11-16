package Invoice;

import DBUtils.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Banme.com
 */
public class InvoiceDAO {
        private Connection connection;
    private PreparedStatement ps;
    ResultSet rs;
    public List<InvoiceDTO> getAllInvoices() throws SQLException {
    List<InvoiceDTO> invoiceList = new ArrayList<InvoiceDTO>();
    InvoiceDTO invoice;
    String sql = "SELECT * FROM tblInvoice;";
    try {
        connection = DBconnect.getDBconnect();
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            invoice = new InvoiceDTO(
                    rs.getString("invId"), 
                    rs.getString("userID"), 
                    rs.getString("dateBuy"),
                    rs.getString("gmail"),
                    rs.getString("address"),
                    rs.getFloat("total")
            );
            invoiceList.add(invoice);
        }
    } catch (Exception ex) {
        // Handle exception
    } finally {
         if(ps != null) ps.close();
        if(connection != null) connection.close();
    }
    
    return invoiceList;
}
public boolean createInvoice(InvoiceDTO invoice) throws ClassNotFoundException, SQLException {
    String sql = "INSERT INTO tblInvoice (invId, userID, dateBuy, gmail, address, total) VALUES (?, ?, ?, ?, ?, ?)";
    boolean response = false;
   
    try {
        connection = DBconnect.getDBconnect();
        if(connection != null){
            ps = connection.prepareStatement(sql);
            ps.setString(1, invoice.getInvId());
            ps.setString(2, invoice.getUserID());
            ps.setString(3, invoice.getDateBuy());
            ps.setString(4, invoice.getGmail());
            ps.setString(5, invoice.getAddress());
            ps.setFloat(6, invoice.getTotal());
            response = ps.executeUpdate() > 0;
        }
    } finally {
        if(ps != null) ps.close();
        if(connection != null) connection.close();
    }
    return response;
}
public List<InvoiceDTO> getInvoicesByUser(String userID) throws ClassNotFoundException, SQLException {
    List<InvoiceDTO> invoiceList = new ArrayList<InvoiceDTO>();
    InvoiceDTO invoice;
    String sql = "SELECT * FROM tblInvoice WHERE userID = ?;";
    try {
        connection = DBconnect.getDBconnect();
        ps = connection.prepareStatement(sql);
        ps.setString(1, userID);
        
        rs = ps.executeQuery();
        while (rs.next()) {
            invoice = new InvoiceDTO(
                    rs.getString("invId"), 
                    rs.getString("userID"), 
                    rs.getString("dateBuy"),
                    rs.getString("gmail"),
                    rs.getString("address"),
                    rs.getFloat("total")
            );
            invoiceList.add(invoice);
        }
    } catch (Exception ex) {
        // Handle exception
    } finally {
        if(ps != null) ps.close();
        if(connection != null) connection.close();
    }
    
    return invoiceList;
}
public boolean invoiceExists(String invId) throws SQLException {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "SELECT invId FROM tblInvoice WHERE invId = ?";
    try {
        conn = DBconnect.getDBconnect();
        if (conn != null) {
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, invId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    return false;
}
    final static String DELETE = "DELETE tblInvoice where invId = ?";
    public boolean remove(String invoiceID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(DELETE);
                pst.setString(1, invoiceID);
                check = pst.executeUpdate() > 0 ? true : false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
}
