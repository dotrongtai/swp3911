/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TRONG TAI
 */
public class OrderDetail {
    private int id;
    private Order oid;
    private Product pid;
    private ProductVariant variantId;
    private int price;
    private int quantity;
    private int total;
    private String nameProduct; 

    public OrderDetail() {
    }

    public OrderDetail(int id, Order oid, Product pid, ProductVariant variantId, int price, int quantity, int total) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.variantId = variantId;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public OrderDetail(int id, Order oid, Product pid, ProductVariant variantId, int price, int quantity, int total, String nameProduct) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.variantId = variantId;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
        this.nameProduct = nameProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOid() {
        return oid;
    }

    public void setOid(Order oid) {
        this.oid = oid;
    }

    public Product getPid() {
        return pid;
    }

    public void setPid(Product pid) {
        this.pid = pid;
    }

    public ProductVariant getVariantId() {
        return variantId;
    }

    public void setVariantId(ProductVariant variantId) {
        this.variantId = variantId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", oid=" + oid + ", pid=" + pid + ", variantId=" + variantId + ", price=" + price + ", quantity=" + quantity + ", total=" + total + '}';
    }
    
}
