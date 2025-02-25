/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class ProductVariant {
    private int id;
    private Product product;
    private Color color;
    private int stock;
    private int productId;
    private int colorId;

    public ProductVariant(int id, Product product, Color color, int stock) {
        this.id = id;
        this.product = product;
        this.color = color;
        this.stock = stock;
    }

    public ProductVariant(int id, int stock, int productId, int colorId) {
        this.id = id;
        this.stock = stock;
        this.productId = productId;
        this.colorId = colorId;
    }


    public ProductVariant() {
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }
}
