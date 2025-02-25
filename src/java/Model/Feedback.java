/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Feedback {

    private int id;
    private int userID;
    private int pid;
    private String comment;
    private int rate;
    private Date createdAt;
    private String userName;
    private User user;
    
    public Feedback() {
    }

    public Feedback(int id, int userID, int pid, String comment, int rate, Date createdAt) {
        this.id = id;
        this.userID = userID;
        this.pid = pid;
        this.comment = comment;
        this.rate = rate;
        this.createdAt = createdAt;
    }

    public Feedback(int id, int userID, int pid, String comment, int rate, Date createdAt, String userName) {
        this.id = id;
        this.userID = userID;
        this.pid = pid;
        this.comment = comment;
        this.rate = rate;
        this.createdAt = createdAt;
        this.userName = userName;
    }

    public Feedback(int id, int userID, int pid, String comment, int rate, Date createdAt, String userName, User user) {
        this.id = id;
        this.userID = userID;
        this.pid = pid;
        this.comment = comment;
        this.rate = rate;
        this.createdAt = createdAt;
        this.userName = userName;
        this.user = user;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
