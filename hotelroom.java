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
public class hotelroom{
    
   private Connection conn = null;

    private final String db_user = "root";
    private final String db_pass = "";
    private final String db_driver = "com.mysql.jdbc.Driver";
    private final String db_url = "jdbc:mysql://localhost:3306/hotelreservationdb"; 
    
    
   private int roomid;
   private String roomtype;
   private double roomcost;
   private int isEnable;
   private int hotelid;
   
   private PreparedStatement pstmt;
   ResultSet rs;
   
   public hotelroom(){
       
   }
   
    public hotelroom(int roomid){
     this.roomid=roomid;

   }
   
   
   public hotelroom(String roomtype, double roomcost, int isEnable, int hotelid){
       

       this.roomtype=roomtype;
       this.roomcost=roomcost;
       this.isEnable=isEnable;
       this.hotelid=hotelid;

       
   }
   
   
   public int getRoomId(){
       return this.roomid;
   }
   
   public void setRoomId(int roomid){
       this.roomid=roomid;
   }
   
   public String getRoomType(){
       return this.roomtype;
   }
   
   public void setRoomType(String roomtype){
       this.roomtype=roomtype;
   }
      
   public double getRoomCost(){
       return this.roomcost;
   }
   
   public void setRoomCost(double roomcost){
       this.roomcost=roomcost;
   }
   
   public int isEnable(){
       return this.isEnable;
   }
   
   public void setEnable(int isEnable){
       this.isEnable=isEnable;
   }
   
   public int getHotelId(){
       return this.hotelid;
   }
   
   public void setHotelId(int hotelid){
       this.hotelid=hotelid;
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
    
    
    public double takeRoomCost(int roomid) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select roomcost from hotelrooms where roomid = ?");
        pstmt.setInt(1, roomid);
        rs = pstmt.executeQuery();
        rs.first();

        
        return rs.getDouble("roomcost");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return 0;  
        }
        
    } 
          //--------------------------------------------------------------------------   
    
    
    public String takeRoomType(int roomid) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select roomtype from hotelrooms where roomid = ?");
        pstmt.setInt(1, roomid);
        rs = pstmt.executeQuery();
        rs.first();

        
        return rs.getString("roomtype");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return "";  
        }
        
    } 
     //--------------------------------------------------------------------------    
    
    
    public int takeHotelId(int roomid) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("select hotelid from hotelrooms where roomid = ?");
        pstmt.setInt(1, roomid);
        rs = pstmt.executeQuery();
        rs.first();
        return rs.getInt("hotelid");
    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return 0;  
        }
    }
   //--------------------------------------------------------------------------
    
    
}