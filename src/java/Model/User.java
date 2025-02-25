/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class User {

    private int id;
    private String email;
    private String pass;
    private String fullName;
    private String phone;
    private String address;
    private int roleId;
    private String gender;
    private Date dob;

    public User() {
    }

    public User(int id, String email, String pass, String fullName, String phone, String address, int roleId, String gender, Date dob) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.roleId = roleId;
        this.gender = gender;
        this.dob = dob;
    }

    public User(String email, String pass, String fullName, String phone, String address, int roleId, String gender, Date dob) {
        this.email = email;
        this.pass = pass;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.roleId = roleId;
        this.gender = gender;
        this.dob = dob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }


    public void setDateOfBirth(java.sql.Date date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
