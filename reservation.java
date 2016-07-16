/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Reservation;

/**
 *
 * @author asus1
 */






import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author asus1
 */
public class reservation {
    private Connection conn = null;
    private final String db_user = "root";
    private final String db_pass = "melis";
    private final String db_driver = "com.mysql.jdbc.Driver";
    private final String db_url = "jdbc:mysql://localhost:3306/hotelreservationdb"; 
    
    
   private int reservationid;
   private int userid;
   private int roomid;
   private String checkin;
   private String checkout;
   private String usermessage;
   private String reservationdate;
  private int roomcost;
  
    public String getReservationdate() {
        return reservationdate;
    }

    public void setReservationdate(String reservationdate) {
        this.reservationdate = reservationdate;
    }
   private int isCancelled;

    public String getCheckout() {
        return checkout;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }
  
    public String getCheckin() {
        return checkin;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }
 
   
   private PreparedStatement pstmt;
   ResultSet rs;

    public void setReservationid(int reservationid) {
        this.reservationid = reservationid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

 
    public void setUserMessage(String usermessage) {
        this.usermessage = usermessage;
    }

   

    public void setIsCancelled(int isCancelled) {
        this.isCancelled = isCancelled;
    }
  

    public int getReservationid() {
        return reservationid;
    }

    public int getUserid() {
        return userid;
    }

    public int getRoomid() {
        return roomid;
    }



    public String getUserMessage() {
        return usermessage;
    }


    public int getIsCancelled() {
        return isCancelled;
    }
   

    
    
    
    
  
   
    public reservation(){
        
    }
    public void initializeJdbc() throws SQLException {
        try {
            Class.forName(db_driver);
            conn = (Connection) DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean addreservation(int reservationid, int userid,int roomid,String checkin,String checkout,String usermessage,String reservationdate,int isCancelled){
     try {

            initializeJdbc();
            pstmt = conn.prepareStatement("insert into hotelreservationdb.reservation "
                    + "(userid, roomid, checkin, checkout, usermessage, reservationdate,isCancelled) values (?, ?, ?, ?, ?, ?,?)");
            
            pstmt.setInt(1, userid);
            pstmt.setInt(2, roomid);
            pstmt.setString(3, checkin);
            pstmt.setString(4,  checkout);
            pstmt.setString(5, usermessage);
            pstmt.setString(6, reservationdate);
             pstmt.setInt(7, isCancelled);

            pstmt.executeUpdate();
          
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }    
         

        return true;
    }
    
      //--------------------------------------------------------------------------   
    
    public ResultSet takeReservation() throws SQLException {
        initializeJdbc();
        

        pstmt = conn.prepareStatement("SELECT * FROM reservation ORDER BY reservationid DESC LIMIT 1");       

        rs = pstmt.executeQuery();
                 while(rs.next()){

rs.getString("reservationid");
rs.getString("checkin");
rs.getString("checkout");
rs.getString("usermessage");

                }
        return rs;
    }
     public ResultSet defineReservation() throws SQLException {
        initializeJdbc();
        

        pstmt = conn.prepareStatement("SELECT * FROM reservation ORDER BY reservationid DESC LIMIT 1");       

        rs = pstmt.executeQuery();

        return rs;
    }
     
     public int takeroomid(String roomtype)throws SQLException {
   try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select roomid from hotelrooms where roomtype = ?");
        pstmt.setInt(1, roomid);
        rs = pstmt.executeQuery();
        rs.first();

        return rs.getInt("roomid");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return 0;  
        }
        
    }
     public boolean datetodate(Date date1,Date date2) throws ParseException{
       
        	if(date1.compareTo(date1)>0){
        	 return false;
        	}else if(date1.compareTo(date2)<=0){
        	return true;
        	}
     
      return false;
    
}
}




