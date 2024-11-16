package User;

/**
 *
 * @author Banme.com
 */
public class UserDTO {

    public UserDTO() {
    }

    public UserDTO(String userID, int password, String fullName, int roleId) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.roleId = roleId;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
       private String userID; 
        private int password; 
    private String fullName; 
    private int roleId;
   

}
