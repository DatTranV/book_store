package Books;

/**
 *
 * @author Banme.com
 */
public class BooksDTO {

    public BooksDTO() {
    }

    public BooksDTO(String BooksID, String BookName, String AuthorName, String Category, String Description, String Images, float price, int discount, int quantity, int notSale) {
        this.BooksID = BooksID;
        this.BookName = BookName;
        this.AuthorName = AuthorName;
        this.Category = Category;
        this.Description = Description;
        this.Images = Images;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.notSale = notSale;
    }

    public String getBooksID() {
        return BooksID;
    }

    public void setBooksID(String BooksID) {
        this.BooksID = BooksID;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String BookName) {
        this.BookName = BookName;
    }

    public String getAuthorName() {
        return AuthorName;
    }

    public void setAuthorName(String AuthorName) {
        this.AuthorName = AuthorName;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getNotSale() {
        return notSale;
    }

    public void setNotSale(int notSale) {
        this.notSale = notSale;
    }

    private String BooksID;
    private String BookName;
    private String AuthorName;
    private String Category;
    private String Description;
    private String Images;
    private float price;
    private int discount;

    private int quantity;
    private int notSale;

}
