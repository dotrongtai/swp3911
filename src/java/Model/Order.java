/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author TRONG TAI
 */
public class Order {

    private int id;
    private User userId;
    private Date date;
    private Status statusid;
    private double total;
    private List<OrderDetail> orderDetails;
    private String name;
    private String phone;
    private String province;
    private String district;
    private String commune;
    private String detailedAddress;

    public Order() {
        orderDetails = new ArrayList<>();
    }

    public Order(int id, User userId, Date date, Status statusid, double total) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.statusid = statusid;
        this.total = total;
        orderDetails = new ArrayList<>();
    }

    public Order(int id, User userId, Date date, Status statusid, double total, List<OrderDetail> orderDetails, String name, String phone, String province, String district, String commune, String detailedAddress) {
        this.id = id;
        this.userId = userId;
        this.date = date;
        this.statusid = statusid;
        this.total = total;
        this.orderDetails = orderDetails;
        this.name = name;
        this.phone = phone;
        this.province = province;
        this.district = district;
        this.commune = commune;
        this.detailedAddress = detailedAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Status getStatusid() {
        return statusid;
    }

    public void setStatusid(Status statusid) {
        this.statusid = statusid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public void addOrderDetail(OrderDetail orderDetail) {
        this.orderDetails.add(orderDetail);
    }

    public void removeOrderDetail(OrderDetail orderDetail) {
        this.orderDetails.remove(orderDetail);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getDetailedAddress() {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

}
