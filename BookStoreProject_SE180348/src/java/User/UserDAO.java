package User;

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


public class UserDAO {
    private static final String LOGIN = "SELECT fullname, role FROM tbl_User WHERE userID=? AND password=? ";
       public UserDTO login(String userID, String password) throws SQLException {
               UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
               
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullname");
                    int roleID = rs.getInt("role");
                    user = new UserDTO(userID, 0, fullName, roleID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
       
       
          public boolean getDuplicateID(String userID) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean status = false;
        try {
            conn = DBconnect.getDBconnect();
            pst = conn.prepareStatement("SELECT * from tbl_User WHERE userID = ?");
            pst.setString(1, userID);
            rs = pst.executeQuery();
            status = rs.next();

        } catch (SQLException E) {
            E.printStackTrace();
        }
        return status;
    }

    // create 
    public boolean create(UserDTO user) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement("INSERT INTO tbl_User values (?, ?, ?,?)");
                pst.setString(1, user.getUserID());
                pst.setInt(2, user.getPassword());
                pst.setString(3, user.getFullName());
                pst.setInt(4, user.getRoleId());

                check = pst.executeUpdate() > 0 ? true : false;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
    
    
     public List<UserDTO> getAllUsers() throws SQLException {
    List<UserDTO> list = new ArrayList<>();
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    try {
        conn = DBconnect.getDBconnect();
        if (conn != null) {
            String sql = "SELECT * FROM tbl_User";
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                int password = rs.getInt("password");
                String fullname = rs.getString("fullname");
                int roleID = rs.getInt("role");
         

                list.add(new UserDTO(userID, password, fullname, roleID));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ptm != null) ptm.close();
        if (conn != null) conn.close();
    }
    return list;
}
     
     
         final static String UPDATE ="UPDATE tbl_User SET fullname = ? ,role =  ?  WHERE userID = ?";
        public boolean update(UserDTO user) {
        boolean check =false;
            Connection conn  = null; 
            PreparedStatement pst = null; 
            ResultSet rs = null; 
            try {
                conn = DBconnect.getDBconnect();
                if(conn != null) {
                    pst  =conn.prepareStatement(UPDATE);
                    pst.setString(1, user.getFullName());
            
            
                    pst.setInt(2, (int) user.getRoleId());
                    pst.setString(3, user.getUserID());
                    
                   
                            
                    check = pst.executeUpdate()>0?true:false;
                }
            }catch(SQLException e ) {
                e.printStackTrace();
            }
            return check;
   }

    public List<UserDTO> search(String name) {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement("SELECT * FROM tbl_User where userID LIKE ?  ");
                pst.setString(1, "%" + name + "%");
                rs = pst.executeQuery();
                while (rs.next()) {

                    listUser.add(new UserDTO(rs.getString(1) , rs.getInt(2), rs.getString(3), rs.getInt(4)));

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUser;
    }

    public boolean getRemoveUser(String userID) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = DBconnect.getDBconnect();
            if (conn != null) {
                pst = conn.prepareStatement("DELETE tbl_User where userID = ?");
                pst.setString(1, userID);
                check = pst.executeUpdate() > 0 ? true : false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;

    }
    
    
   // cart 
  
}
