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
    
    
    public String takeHotelName(int roomid) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select hotelid from hotelrooms where roomid = ?");
        pstmt.setInt(1, roomid);
        rs = pstmt.executeQuery();
        rs.first();

        int hotelid = rs.getInt("hotelid");
        
        pstmt = conn.prepareStatement("select hotelname from hotel where hotelid = ?");
        pstmt.setInt(1, hotelid);
        rs = pstmt.executeQuery();
        rs.first();
        
        return rs.getString("hotelname");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return "";  
        }
        
    } 
    //--------------------------------------------------------------------------    
    
    
    public boolean cancelReservation(int rid) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("update reservation set isCancelled=1 where reservationid= ?");
        pstmt.setInt(1, rid);
        pstmt.executeUpdate();

    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return false;  
        }
        return true;
    }
   //--------------------------------------------------------------------------    
    
    
    public ResultSet takeMyReservations(int id) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("select * from reservation where userid = ?");
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        rs.beforeFirst();
        return rs;
    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return null;  
        }
    }
     //--------------------------------------------------------------------------    
    
     
     
    public boolean addComment(int hotelid, int userid, String comment, int rating) throws SQLException {
        try {
          if(comment==""){
            return false;
           }
          else{
            
            initializeJdbc();

            pstmt = conn.prepareStatement("insert into usercomments "
                    + "(hotel_hotelid, user_id, comment, rating) values (?, ?, ?, ?)");
            
            pstmt.setInt(1, hotelid);
            pstmt.setInt(2, userid);
            pstmt.setString(3, comment);
            pstmt.setInt(4, rating);
            pstmt.executeUpdate();
          }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    
   //--------------------------------------------------------------------------
    
    
}