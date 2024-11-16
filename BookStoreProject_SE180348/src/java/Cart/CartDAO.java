package Cart;

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
public class CartDAO {
    private Connection connection;
    private PreparedStatement ps;
    ResultSet rs;
    public boolean addToCart(String cartId,String BooksID, float price, float totalPrice, int quantity,String image,String userID,String invId) throws SQLException, ClassNotFoundException {
    String sql = "INSERT INTO tblCart (cartId, BooksID, price, totalPrice, quantity,image,userID,invId) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    boolean response = false;
    try {
        connection = DBconnect.getDBconnect();
        ps = connection.prepareStatement(sql);
        
        ps.setString(1, cartId);
        ps.setString(2, BooksID.trim());
        ps.setFloat(3, price);
        ps.setFloat(4, totalPrice);
        ps.setInt(5, quantity);
        ps.setString(6, image);
        ps.setString(7, userID);
        ps.setString(8, invId);
        response = ps.executeUpdate() > 0;
    } catch (SQLException ex) {
    } finally {
        if(ps != null) ps.close();
        if(connection != null) connection.close();
    }
    return response;
}

    public boolean removeFromCart(String cartId) {
        String sql = "DELETE FROM tblCart WHERE cartId = ?;";
        boolean response = true;
        try {
            connection = DBconnect.getDBconnect();
            ps = connection.prepareStatement(sql);
            ps.setString(1, cartId);
            response = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception ex) {
        }
        return response;
    }
    
    public List<CartDTO> getCart(String userID) throws SQLException {
    List<CartDTO> cartList = new ArrayList<CartDTO>();
    CartDTO cart;
    String sql = "SELECT * FROM tblCart WHERE userID = ?;";
    try {
        connection = DBconnect.getDBconnect();
        ps = connection.prepareStatement(sql);
        ps.setString(1, userID); // Set the userID parameter
        rs = ps.executeQuery();
        while (rs.next()) {
            cart = new CartDTO(rs.getString("cartId"), rs.getString("BooksID"),rs.getString("invId"), rs.getString("userID"),rs.getString("image"), rs.getFloat("price"), rs.getFloat("totalPrice"), rs.getInt("quantity"));
            cartList.add(cart);
        }
    } catch (Exception ex) {
        // Handle your exception here
    } finally {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(connection != null) connection.close();
    }
    return cartList;
}

    public boolean updateCart(CartDTO cart) throws ClassNotFoundException {
    String sql = "UPDATE tblCart SET totalPrice = ?, quantity = ? WHERE cartId = ?;";
    boolean response = false;
    try {
        connection = DBconnect.getDBconnect();
        ps = connection.prepareStatement(sql);
        
        ps.setFloat(1, cart.getPrice() * cart.getQuantity()); // Set totalPrice
        ps.setInt(2, cart.getQuantity()); // Set quantity
        ps.setString(3, cart.getCartId()); // Set cartId
        
        response = ps.executeUpdate() > 0;
    } catch (SQLException ex) {
        // Handle your exception here
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            // Handle your exception here
        }
    }
    return response;
}

    public CartDTO getCartByBooksID(String BooksID, String userID) throws ClassNotFoundException {
        String sql = "SELECT * FROM tblCart WHERE BooksID = ? and userID =?;";
        CartDTO cart = null;
        try {
            connection = DBconnect.getDBconnect();
            ps = connection.prepareStatement(sql);
            ps.setString(1, BooksID);
            ps.setString(2, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String cartId = rs.getString("cartId");
                
                String invId = rs.getString("invId");
                float price = rs.getFloat("price");
                float totalPrice = rs.getFloat("totalPrice");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                cart = new CartDTO(cartId, BooksID,invId,userID, image, price, totalPrice, quantity);
            }
        } catch (SQLException ex) {
            // Handle your exception here
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                // Handle your exception here
            }
        }
        return cart;
    }
    public CartDTO getCartById(String cartId) throws ClassNotFoundException {
        String sql = "SELECT * FROM tblCart WHERE cartId = ?;";
        CartDTO cart = null;
        try {
            connection = DBconnect.getDBconnect();
            ps = connection.prepareStatement(sql);
            ps.setString(1, cartId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String BooksID = rs.getString("BooksID");
                String userID = rs.getString("userID");
                String invId = rs.getString("invId");
                float price = rs.getFloat("price");
                float totalPrice = rs.getFloat("totalPrice");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                cart = new CartDTO(cartId, BooksID,invId,userID, image, price, totalPrice, quantity);
            }
        } catch (SQLException ex) {
            // Handle your exception here
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                // Handle your exception here
            }
        }
        return cart;
    }
    public void updateInvId(CartDTO cart) throws SQLException, ClassNotFoundException {
    String sql = "UPDATE tblCart SET invId = ? WHERE cartId = ?";
    connection = DBconnect.getDBconnect();
    PreparedStatement ps = connection.prepareStatement(sql);
    ps.setString(1, cart.getInvId());
    ps.setString(2, cart.getCartId());
    ps.executeUpdate();
}
}
    

