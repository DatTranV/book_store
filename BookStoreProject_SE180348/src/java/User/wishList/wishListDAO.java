package User.wishList;

import Books.BooksDTO;
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
public class wishListDAO {
    
    public wishListDAO() {
    }
    public boolean Insert(String userID , String booksID) {
        boolean  check  = false;
        Connection conn = null; 
        PreparedStatement pst = null;
         
        try {
            conn =DBconnect.getDBconnect();
            if (conn != null) {
               pst =conn.prepareStatement("INSERT INTO tbl_wishList(userID,BooksID) VALUES ( ? , ? );");
               pst.setString(1,userID); 
               pst.setString(2, booksID);
               if(pst.executeUpdate() > 0 ) {
                   check = true;
               }else {
                   check =false;
               }
            }   
        }catch(SQLException ex) {
            ex.printStackTrace();
        }
        return check;
    }
    
     public  List<BooksDTO> getallProduct(String userID) {
        List<BooksDTO> list = new ArrayList<>();
       Connection conn = null; 
        PreparedStatement pst = null; 
        ResultSet rs = null; 
        
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement("SELECT B.BooksID , B.BookName , B.AuthorName ,B.Category , B.description , B.images, B.price ,B.discount , B.quantity , B.notSale   from tbl_wishList  W  join tbl_Books  B  ON W.BooksID = B.BooksID  WHERE W.userID =  ? ");
                pst.setString(1, userID);
                rs = pst.executeQuery(); 
                while(rs.next()){
                    String BooksID = rs.getString("BooksID");
                String BookName = rs.getString("BookName");
                String AuthorName = rs.getString("AuthorName");
                String Category = rs.getString("Category");
                String description = rs.getString("description");
                         String images = rs.getString("images");
                
                float price = rs.getFloat("price");
                int discount = rs.getInt("discount");
                int quantity = rs.getInt("quantity");
                int notSale = rs.getInt("notSale");
                    list.add(new BooksDTO(BooksID, BookName, AuthorName,Category,description, images,price,discount,quantity,notSale));
                }
            }
        }catch (SQLException e) {
           e.printStackTrace();
        }
       return list;         
    }
    
    // check if product was added in wish list return true
    public  boolean exsist(String booksID){
        boolean check  = false;
        Connection conn = null; 
        PreparedStatement pst = null; 
        ResultSet rs = null; 
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
               pst = conn.prepareStatement("SELECT * FROM  tbl_wishList where BooksID= ? ");
               pst.setString(1, booksID);
               rs  = pst.executeQuery();
               if (rs.next()) {
                    check = true;
               } 
            }
        }catch(SQLException ex) {
             System.out.println(ex.toString()); 
        }
       return check; 
    }
    // remove wish List 
    public boolean removed(String userID , String booksID) {
        boolean check  = false;
        Connection  conn = null; 
        PreparedStatement pst = null; 
        try {
            conn = DBconnect.getDBconnect(); 
            if(conn != null) {
                pst = conn.prepareStatement("DELETE from  tbl_wishList where userID =? AND BooksID = ? ");
                pst.setString(1, userID);
                pst.setString(2, booksID);
                
                if(pst.executeUpdate() > 0 )  {
                    check = true;
                }else {
                    check = false;
                }
            }
    
            
        }catch(SQLException ex) {
            ex.printStackTrace();
            
        }
        return check;
    }
}
