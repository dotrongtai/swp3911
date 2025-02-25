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
public class Payment {
//    UPDATE [dbo].[Payment]
//   SET [oid] = <oid, int,>
//      ,[type] = <type, int,>
//      ,[date] = <date, date,>
//      ,[amount] = <amount, real,>
// WHERE <Search Conditions,,>
    private int id;
    private int oid;
    private int type;
    private Date date;
    private int amount;

    public Payment() {
    }

    public Payment(int id, int oid, int type, Date date, int amount) {
        this.id = id;
        this.oid = oid;
        this.type = type;
        this.date = date;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
            
}
