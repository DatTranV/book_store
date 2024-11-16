package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Banme.com
 */
public class DBconnect {
         public static final String connectionUrl = "jdbc:sqlserver://localhost:1433;"+
             "databaseName=BookStore;user=sa;password=12345";
     public static Connection getDBconnect(){
         try {
             Connection con = null;
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             con = DriverManager.getConnection(connectionUrl);
             return con;
         } catch (ClassNotFoundException ex) {
             System.out.println("where is Driver");
         } catch (SQLException ex){
             System.out.println("error: "+ex.toString());
         }
         return null;
     }
}
