/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author YGZ
 */
public class reservation{
    
   private Connection conn = null;

    private final String db_user = "root";
    private final String db_pass = "";
    private final String db_driver = "com.mysql.jdbc.Driver";
    private final String db_url = "jdbc:mysql://localhost:3306/hotelreservationdb"; 
    
    
   private int reservationid;
   private int userid;
   private Date checkin;
   private Date checkout;
   private String usermessage;
   private Date reservationdate;
   private int isCancelled;
   
   private PreparedStatement pstmt;
   ResultSet rs;
   
   public reservation(){
       
   }
   
    public reservation(int userid){
     this.userid=userid;

   }
   
   
   public reservation(int userid, Date checkin, Date checkout, String usermessage, Date reservationdate){
       

       this.userid=userid;
       this.checkin=checkin;
       this.checkout=checkout;
       this.usermessage=usermessage;
       this.reservationdate=reservationdate;
       
   }
   
   
   public int getReservationId(){
       return this.reservationid;
   }
   
   public void setReservationId(int reservationid){
       this.reservationid=reservationid;
   }
   
   public int getUserId(){
       return this.userid;
   }
   
   public void setUserId(int userid){
       this.userid=userid;
   }
      
   public Date getCheckIn(){
       return this.checkin;
   }
   
   public void setCheckIn(Date checkin){
       this.checkin=checkin;
   }
   
   public Date getCheckOut(){
       return this.checkout;
   }
   
   public void setCheckOut(Date checkout){
       this.checkout=checkout;
   }
   
   public String getUserMessage(){
       return this.usermessage;
   }
   
   public void setUserMessage(String usermessage){
       this.usermessage=usermessage;
   }
   
   public Date getReservationDate(){
       return this.reservationdate;
   }
   
   public void setReservationDate(Date reservationdate){
       this.reservationdate=reservationdate;
   }
    //--------------------------------------------------------------------------
   
    public void initializeJdbc() throws SQLException {
        try {
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
   //--------------------------------------------------------------------------
    
    
}