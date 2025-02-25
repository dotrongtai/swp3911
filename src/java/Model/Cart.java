/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


/**
 *
 * @author ADMIN
 */
public class Cart {

    private int id;
    private int userId;
    private int pid;
    private int variantId; // Add variantId field
    private int quantity;
    private int price;
    private int totalOneProduct;
    private String image;
    private String name;
    private int colorId; // Add colorId field
    private String colorName; // Add colorName field
    private int stockVariant;
    

    public Cart() {
    }

    public Cart(int id, int userId, int pid, int variantId, int quantity, int price, int totalOneProduct, String image, String name, int colorId, String colorName) {
        this.id = id;
        this.userId = userId;
        this.pid = pid;
        this.variantId = variantId;
        this.quantity = quantity;
        this.price = price;
        this.totalOneProduct = totalOneProduct;
        this.image = image;
        this.name = name;
        this.colorId = colorId;
        this.colorName = colorName;
    }

    public Cart(int id, int userId, int pid, int variantId, int quantity, int price, int totalOneProduct, String image, String name, int colorId, String colorName, int stockVariant) {
        this.id = id;
        this.userId = userId;
        this.pid = pid;
        this.variantId = variantId;
        this.quantity = quantity;
        this.price = price;
        this.totalOneProduct = totalOneProduct;
        this.image = image;
        this.name = name;
        this.colorId = colorId;
        this.colorName = colorName;
        this.stockVariant = stockVariant;
    }

    public int getStockVariant() {
        return stockVariant;
    }

    public void setStockVariant(int stockVariant) {
        this.stockVariant = stockVariant;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotalOneProduct() {
        return totalOneProduct;
    }

    public void setTotalOneProduct(int totalOneProduct) {
        this.totalOneProduct = totalOneProduct;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    
}
