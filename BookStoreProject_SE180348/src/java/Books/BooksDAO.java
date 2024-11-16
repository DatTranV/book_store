package Books;

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
public class BooksDAO {

    final static String LOAD = "SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books where notSale = 0";
//    final static String SEARCH_ID = "SELECT mobileID , mobileName , description , price , yearOfProduction , quantity , notSale from tbl_Mobile where mobileId LIKE ?";
    final static String SEARCH_NAME = "SELECT BooksID , BookName , AuthorName , Category , description , images , price , discount, quantity, notSale from tbl_Books where BookName LIKE ? AND notSale = 0";
      final static String SEARCH_AUTHOR = "SELECT BooksID , BookName , AuthorName , Category , description , images , price , discount, quantity, notSale from tbl_Books where AuthorName LIKE ? AND notSale = 0";
    final static String GET_BY_ID = "SELECT * FROM tbl_Books WHERE BooksID = ?";
    final static String SEARCH_BY_CATEGORY = "SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books where Category LIKE ? AND notSale = 0";

    final static String DELETE = "DELETE tbl_Books where BooksID = ?";
    final static String UPDATE = "UPDATE tbl_Books SET  BookName=? , AuthorName=? , Category=? , description=? , images=?, price=?, discount=?, quantity=? , notSale=?  WHERE BooksID = ?";
//    final static String GET_BOOKS_CART = "SELECT mobileID , mobileName , description , price , yearOfProduction , quantity , notSale from tbl_Mobile where notSale = 0 AND  mobileID = ?";
    final static String LOADALL = "SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books";

    public BooksDAO() {
    }

    // load all Books product
    public List<BooksDTO> load() {
        List<BooksDTO> list = new ArrayList<>();
        BooksDTO books = new BooksDTO();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(LOAD);
                rs = pst.executeQuery();

                while (rs.next()) {
                    books = new BooksDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    list.add(books);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//     final static String LOAD = "SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books";   
    public BooksDTO getbyID(String id) {
        BooksDTO book = null;

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(GET_BY_ID);
                pst.setString(1, id); // Set the book ID parameter
                rs = pst.executeQuery();

                if (rs.next()) {
                    // Retrieve data from the result set and create a BooksDTO object
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

                    book = new BooksDTO(BooksID, BookName, AuthorName, Category, description, images, price, discount, quantity, notSale);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in reverse order of their creation
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return book;
    }

    public List<BooksDTO> getSearchBooksBy_Category(String category) {
        List<BooksDTO> list = new ArrayList<>();
        BooksDTO books = new BooksDTO();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();

            if (conn != null) {
                pst = conn.prepareStatement(SEARCH_BY_CATEGORY);
                pst.setString(1, "%" + category + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    books = new BooksDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    list.add(books);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

//    // searh product by  ID
//    public List<MobileDTO> getSearchMobileBY_ID(String mobileID) {
//        List<MobileDTO> list = new ArrayList<>();
//        MobileDTO mobile = new MobileDTO();
//        Connection conn = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try {
//            conn = DBconnect.getDBconnect();
//
//            if (conn != null) {
//                pst = conn.prepareStatement(SEARCH_ID);
//                pst.setString(1, "%" + mobileID + "%");
//                rs = pst.executeQuery();
//                while (rs.next()) {
//                    mobile = new MobileDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5), rs.getInt(6), rs.getInt(7));
//                    list.add(mobile);
//                }
//
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    // search by name
    public List<BooksDTO> getSearchBooksBy_NAME(String Bookname) {
        List<BooksDTO> list = new ArrayList<>();
        BooksDTO books = new BooksDTO();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();

            if (conn != null) {
                pst = conn.prepareStatement(SEARCH_NAME);
                pst.setString(1, "%" + Bookname + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    books = new BooksDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    list.add(books);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BooksDTO> getSearchBooksBy_AUTHOR(String Authorname) {
        List<BooksDTO> list = new ArrayList<>();
        BooksDTO books = new BooksDTO();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();

            if (conn != null) {
                pst = conn.prepareStatement(SEARCH_AUTHOR);
                pst.setString(1, "%" + Authorname + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    books = new BooksDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    list.add(books);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // create a  new mobile
    public boolean CreateNewBooks(BooksDTO booksDTO) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBconnect.getDBconnect();

            pst = conn.prepareStatement("INSERT INTO tbl_Books(BooksID,BookName,AuthorName,Category,description,images,price, discount, quantity, notSale) VALUES (?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, booksDTO.getBooksID());
            pst.setString(2, booksDTO.getBookName());

            pst.setString(3, booksDTO.getAuthorName());
            pst.setString(4, booksDTO.getCategory());
            pst.setString(5, booksDTO.getDescription());
            pst.setString(6, booksDTO.getImages());
            pst.setFloat(7, booksDTO.getPrice());
                pst.setInt(8, (int) booksDTO.getDiscount());
            pst.setInt(9, booksDTO.getQuantity());
            pst.setInt(10, booksDTO.getNotSale());

            if (pst.executeUpdate() > 0) {
                check = true;
            } else {
                check = false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    // remove 
  
    public boolean remove(String booksID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(DELETE);
                pst.setString(1, booksID);
                check = pst.executeUpdate() > 0 ? true : false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
    // update 
    // UPDATE tbl_Mobile SET mobileName = ? ,description =  ? ,price = ?, quantity = ? ,notSale = ?  WHERE mobileId = ?

    public boolean update(BooksDTO book) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(UPDATE);
                pst.setString(1, book.getBookName());
                pst.setString(2, book.getAuthorName());
                pst.setString(3, book.getCategory());
                pst.setString(4, book.getDescription());
                pst.setString(5, book.getImages());
                pst.setFloat(6,  book.getPrice());
                pst.setInt(7, (int) book.getDiscount());
                pst.setInt(8,  book.getQuantity());
                pst.setInt(9,  book.getNotSale());
                pst.setString(10, book.getBooksID());

                check = pst.executeUpdate() > 0 ? true : false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
    
//    public MobileDTO getMobileForCart(String mobileID) {
//
//        Connection conn = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        MobileDTO mobile = new MobileDTO();
//
//        try {
//            conn = DBconnect.getDBconnect();
//            if (conn != null) {
//                pst = conn.prepareStatement(GET_MOBILE_CART);
//                pst.setString(1, mobileID);
//                rs = pst.executeQuery();
//                if (rs.next()) {
//                    mobile = new MobileDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getInt(5), 1, rs.getInt(7));
//
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return mobile;
//    }
    public List<BooksDTO> getAllProduct() {
        List<BooksDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        BooksDTO books = new BooksDTO();

        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement(LOADALL);
                rs = pst.executeQuery();
                while (rs.next()) {
                    books = new BooksDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7), rs.getInt(8), rs.getInt(9), rs.getInt(10));
                    list.add(books);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

     public List<BooksDTO> getListProductByPrice(float fromPrice, float toPrice) throws Exception {
        List<BooksDTO> list = new ArrayList<>();
        String sql = "SELECT BooksID , BookName , AuthorName , Category , description , images, price, discount, quantity , notSale from tbl_Books WHERE price BETWEEN ? AND ?";

        try (Connection conn = DBconnect.getDBconnect();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setFloat(1, fromPrice);
            ps.setFloat(2, toPrice);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
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
                    list.add(new BooksDTO(BooksID, BookName, AuthorName, Category, description, images, price, discount, quantity, notSale));
                }
            }
        }
        return list;

    }
}
