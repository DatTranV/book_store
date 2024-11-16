package User.wishList;

/**
 *
 * @author Banme.com
 */
public class wishListDTO {

    public wishListDTO(int wId, String userID, String booksID) {
        this.wId = wId;
        this.userID = userID;
        this.booksID = booksID;
    }

    public int getwId() {
        return wId;
    }

    public void setwId(int wId) {
        this.wId = wId;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getBooksID() {
        return booksID;
    }

    public void setBooksID(String booksID) {
        this.booksID = booksID;
    }
     private int wId; 
    private String userID; 
    private String booksID; 

    public wishListDTO() {
    }
    
    
    

      
}
