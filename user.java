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
import java.sql.Statement;
import java.util.Date;
 
import java.util.Properties;
import java.util.UUID;
 

/**
 *
 * @author YGZ
 */
public class user {
    
   private Connection conn = null;

    private final String db_user = "root";
    private final String db_pass = "";
    private final String db_driver = "com.mysql.jdbc.Driver";
    private final String db_url = "jdbc:mysql://localhost:3306/hotelreservationdb"; 
    
    
   private int id;
   private String username;
   private String firstname;
   private String lastname;
   private String password;
   private String birthdate;
   private String email;
   private String gender;
   private String telephone;
   private String ssn;
   private int type;
   private String address;
   
   private PreparedStatement pstmt;
   private Statement st;
   ResultSet rs;
   
   public user(){
       
   }
   
    public user(String username){
     this.username=username;

   }
   
   public user(String username, String password){
     this.username=username;
     this.password=password;
   }
   
   public user(String username, String firstname, String lastname, String password, String birthdate, String email, String gender, String telephone, int type, String address, String ssn){
       

       this.username=username;
       this.firstname=firstname;
       this.lastname=lastname;
       this.password=password;
       this.birthdate=birthdate;
       this.email=email;
       this.gender=gender;
       this.telephone=telephone;
       this.type=type;
       this.address=address;
       this.ssn=ssn;
       
   }
   
   public int getId(){
       return this.id;
   }
   
   public void setId(int id){
       this.id=id;
   }
      
   public String getUsername(){
       return this.username;
   }
   
   public void setUsername(String username){
       this.username=username;
   }
   
   public String getFirstname(){
       return this.username;
   }
   
   public void setFirstname(String firstname){
       this.firstname=firstname;
   }
   
   public String getLastname(){
       return this.lastname;
   }
   
   public void setLastname(String lastname){
       this.lastname=lastname;
   }
   
   public String getPassword(){
       return this.password;
   }
   
   public void setPassword(String password){
       this.password=password;
   }
   
   public String getBirthdate(){
       return this.birthdate;
   }
   
   public void setBirthdate(String birthdate){
       this.birthdate=birthdate;
   }
   
   public String getEmail(){
       return this.email;
   }
   
   public void setEmail(){
       this.email=email;
   }
   
   public String getGender(){
       return this.gender;
   }
   
   public void setGender(String gender){
       this.gender=gender;
   }
   
   public String getTelephone(){
       return this.telephone;
   }
   
   public void setTelephone(String telephone){
       this.telephone=telephone;       
   }
   
   public String getAddress(){
       return this.address;
   }
   
   public void setAddress(String address){
       this.address=address;
   }
   
   public int getType(){
       return this.type;
   }
   
   public void setType(int type){
       this.type=type;
   }
   
   public String getSsn(){
       return this.ssn;
   }
   
   public void setSsn(String ssn){
       this.ssn=ssn;
   }
   
   
    //--------------------------------------------------------------------------
   
    public void initializeJdbc() throws SQLException {
        try {
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
            st = conn.createStatement();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    //--------------------------------------------------------------------------
    
    
    public boolean addUser() throws SQLException {
        try {
           if((username==""||password==""||firstname==""||lastname==""||gender==""||email==""||telephone==""||!checkPassword(password)||checkTel(telephone)==false||checkMail(email)==false)||!checkSSN(ssn)){
            return false;
           }
           else{
            initializeJdbc();

            pstmt = conn.prepareStatement("insert into hotelreservationdb.user "
                    + "(username, password, firstname, lastname,birthdate,email, gender, "
                    + "telephone, ssn, usertype_id, address ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, firstname);
            pstmt.setString(4, lastname);
            pstmt.setString(5, birthdate);
            pstmt.setString(6, email);
            pstmt.setString(7, gender);
            pstmt.setString(8, telephone);             
            pstmt.setString(9, ssn);
            pstmt.setInt(10, type);
            pstmt.setString(11, address);

            pstmt.executeUpdate();
           }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }    

        return true;
    }
    
    //--------------------------------------------------------------------------
    
    public boolean editUser(String username,String password, String firstname, String lastname, String email, String birthdate, String telephone, String ssn, String address) throws SQLException {
        try {
            if(username==""||firstname==""||lastname==""||birthdate==""||address==""||!checkPassword(password)||checkTel(telephone)==false||checkMail(email)==false||!checkSSN(ssn)){
            return false;
           }
            else{
            initializeJdbc();

            pstmt = conn.prepareStatement("update user set password = ?, firstname = ?, lastname = ?, email = ?, birthdate = ?, telephone = ?, ssn = ?, address = ? where username = ? ");

            pstmt.setString(1, password);
            pstmt.setString(2, firstname);
            pstmt.setString(3, lastname);
            pstmt.setString(4, email);            
            pstmt.setString(5, birthdate);
            pstmt.setString(6, telephone); 
            pstmt.setString(7, ssn);
            pstmt.setString(8, address);
            pstmt.setString(9, username);
            pstmt.executeUpdate();
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
   //--------------------------------------------------------------------------   
    
    
    public String takeFirstname(String username) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select firstname from user where username = ?");
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        rs.first();

        return rs.getString("firstname");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return "";  
        }
        
    }   
    
     //--------------------------------------------------------------------------   
    
    
    public int takeUserId(String username) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select id from user where username = ?");
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        rs.first();

        return rs.getInt("id");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return 0;  
        }
        
    }   
    
     //--------------------------------------------------------------------------
    
    public String checkType(String username, String password) throws SQLException {
        initializeJdbc();
        if(!username.equals("")&&!password.equals("")){    
        pstmt = conn.prepareStatement("select usertype_id from user where username = ? and password = ? ");
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();
        rs.first();
        if(rs.first()==false)
            return "-1";
        
        return rs.getString("usertype_id");
        }
        else{
            return "-1";
        }

        
    }
    //--------------------------------------------------------------------------
    
    public String checkTypePages(String username) throws SQLException {
        initializeJdbc();
        if(username!=null){    
        pstmt = conn.prepareStatement("select usertype_id from user where username = ?");
        pstmt.setString(1, username);

        rs = pstmt.executeQuery();
        rs.first();
        if(rs.first()==false)
            return "-1";
        
        return rs.getString("usertype_id");
        }
        else{
            return "-1";
        }

        
    }    
    
    //--------------------------------------------------------------------------
    
    public boolean checkRegistered(String username, String password) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from user where username = ? and password = ? and usertype_id = ? ");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, "3");

        rs = pstmt.executeQuery();
        rs.first();

        if (rs.first()) {
            return true;
        } else {
            return false;
        }
    }
    
      //--------------------------------------------------------------------------
    
    public boolean checkRegisteredHotel(String username, String password) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from user where username = ? and password = ? and usertype_id = ? ");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, "2");

        rs = pstmt.executeQuery();
        rs.first();

        if (rs.first()) {
            return true;
        } else {
            return false;
        }
    }

    //--------------------------------------------------------------------------
    
    
    
    public boolean checkAdmin(String username, String password) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from user where username = ? and password = ? and usertype_id = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, "1");
        
        rs = pstmt.executeQuery();
        rs.first();

        if (rs.first()) {
            return true;
        } else {
            return false;
        }
    }
    
    //--------------------------------------------------------------------------
    
    public boolean checkAdminPanel(String username) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from user where username = ? AND usertype_id = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, "1");
        
        rs = pstmt.executeQuery();
        rs.first();

        if (rs.first()) {
            return true;
        } else {
            return false;
        }
    }
    
    //--------------------------------------------------------------------------
    
    
    
    public ResultSet userDetails(String username, String password) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from user where username = ? and password = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        
        rs = pstmt.executeQuery();
        
        if(rs.next())
        {
            return rs;
        }
        else return null;
    }
        //--------------------------------------------------------------------------
     public boolean sendMessage(int hotelid,int adminid, String message) throws SQLException {
        try {
          if(hotelid==-1||message==""||adminid==-1){
            return false;
           }
          else{
            
            initializeJdbc();
            
            pstmt = conn.prepareStatement("insert into hotelreservationdb.hotelmessage "
                    + "(hotelid, adminid, message) values (?, ?, ?)");
            
            pstmt.setInt(1, hotelid);
            pstmt.setInt(2, adminid);
            pstmt.setString(3, message);;
            pstmt.executeUpdate();
          }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    }
//--------------------------------------------------------------------------
    
    public ResultSet takeMessageSelected(int userid) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from hotelmessage where hotelid IN ( select hotelid from hotel where user_id = ? )");
        pstmt.setInt(1, userid);
        rs = pstmt.executeQuery();
        rs.beforeFirst();

        return rs;
    }
    
    //--------------------------------------------------------------------------
    
    public String randomName() {
        final String uuid = UUID.randomUUID().toString();
        return uuid;
    }
    
    //--------------------------------------------------------------------------
    
    public boolean deleteMessage(int messageid) throws SQLException {
        try {
        
        initializeJdbc();

        /* pstmt = conn.prepareStatement("delete from hotelmessage where messageid = ? )"); */
        pstmt = conn.prepareStatement("update hotelmessage set isDeleted = 1 where messageid = ? ");
        pstmt.setInt(1, messageid);
        pstmt.executeUpdate();
         
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    }

        
    //--------------------------------------------------------------------------
    
    public boolean deleteMessagePermanent() throws SQLException {
        try {
        
        initializeJdbc();

        pstmt = conn.prepareStatement("delete from hotelmessage where isDeleted = ? "); 

        pstmt.setInt(1, 1);
        pstmt.executeUpdate();
         
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    } 
    
    //--------------------------------------------------------------------------
    
    public int messageNotify(int userid) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select COUNT(isRead) from hotelmessage where isRead = 0 and hotelid IN ( select hotelid from hotel where user_id = ? )");
        pstmt.setInt(1, userid);
        rs = pstmt.executeQuery();
        rs.first();
        int count = Integer.parseInt(rs.getString("COUNT(isRead)"));
        return count;

        
    }
    //--------------------------------------------------------------------------
    
    public boolean readFlag(int messageid) throws SQLException {
        try {
        initializeJdbc();

        pstmt = conn.prepareStatement("update hotelmessage set isRead=1 where messageid = ? ");
        pstmt.setInt(1, messageid);
        pstmt.executeUpdate();

        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        return true;
    
    }
    //--------------------------------------------------------------------------
    
    public ResultSet readMessage(int messageid) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from hotelmessage where messageid = ?");
        pstmt.setInt(1, messageid);
        rs = pstmt.executeQuery();
        rs.first();

        return rs;
    }
    
    //--------------------------------------------------------------------------
    public ResultSet returnTable(String sql) throws SQLException {
        initializeJdbc();

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.beforeFirst();
        return rs;
    }
//--------------------------------------------------------------------------    
    
    
    public ResultSet takeUserInfo(int uid) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("select * from user where id = ?");
        pstmt.setInt(1, uid);
        rs = pstmt.executeQuery();
        rs.first();
        return rs;
    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return null;  
        }
    }
    //--------------------------------------------------------------------------    
    
    
    public ResultSet takeUserInfo(String username) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("select * from user where username = ?");
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        rs.first();
        return rs;
    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return null;  
        }
    }
    
             //--------------------------------------------------------------------------   
    
    
    public String takeUserNamefromID(int id) throws SQLException {
        try {
        
        initializeJdbc();
        pstmt = conn.prepareStatement("select username from user where id = ?");
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        rs.first();

        return rs.getString("username");
    }
        catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return "";  
        }
        
    }  
    
 //--------------------------------------------------------------------------
    
  /*  
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
    }*/

    //--------------------------------------------------------------------------    
    
    
    public ResultSet takeSelectedReservation(int rid) throws SQLException {
        try{
        initializeJdbc();


        pstmt = conn.prepareStatement("select * from reservation where reservationid = ?");
        pstmt.setInt(1, rid);
        rs = pstmt.executeQuery();
        rs.first();
        return rs;
    }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return null;  
        }
    }
    
    //--------------------------------------------------------------------------//

    public ResultSet commentWaitingAprovalHotel(int userid) throws SQLException {
         try{
        initializeJdbc();

        pstmt = conn.prepareStatement("select * from usercomments where isApproved = ? and hotel_hotelid = ANY (select hotelid from hotel where user_id = ? ) ");
        pstmt.setInt(1, 0);
        pstmt.setInt(2, userid);
        
        rs = pstmt.executeQuery(); 
        rs.beforeFirst();
        return rs;
        }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return null;  
        }
    }
   //--------------------------------------------------------------------------//

public boolean commentAcceptHotel(int commentid) throws SQLException {
         try{
        initializeJdbc();

        st.executeUpdate("update usercomments set isApproved='1' where commentid="+commentid);
        return true;
          }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return false;  
        } 
    }

//--------------------------------------------------------------------------//

public boolean commentRejectHotel(int commentid) throws SQLException {
        try{
         initializeJdbc();

        st.executeUpdate("DELETE FROM usercomments where commentid="+commentid);
               return true;
          }
         catch(Exception ex){
          System.out.println("Exception: " + ex.getMessage());
            return false;  
        }
 }   
    
    
    //--------------------------------------------------------------------------
  
      
    
   
    //--------------------------------------------------------------------------
    
    public boolean checkPassword(String p){            
            
        boolean str=false;
        boolean intt=false;
        boolean realPassword=false;        
        
        if(p.length()>=8&&p.length()<=16){
        for(int i=0; i<p.length(); i++){
           char c=p.charAt(i);
           if(c>=48&&c<=57)
               intt=true;
           else
               str=true;            
        }
        if(str==true&&intt==true)
            realPassword=true;
        }
        else
        realPassword=false;
        
        return realPassword;
        
    }
    

    //--------------------------------------------------------------------------
    
  public boolean checkInt(String num){            
 
        boolean intt=false;
        if(num.length()<3){
        for(int i=0; i<num.length(); i++){
           char c=num.charAt(i);
           if(c>=48&&c<=57)
               intt=true;
           else
               return false;
      }       
        }
        return intt;
        
    }
      //--------------------------------------------------------------------------
    
  public boolean checkUsername(String num){            
 
        boolean intt=false;
        
        for(int i=0; i<num.length(); i++){
           char c=num.charAt(i);
           if(c>=48&&c<=57)
               intt=true;
           else
               return false;
      }       
        
        return intt;
        
    }
      //--------------------------------------------------------------------------
    
  public boolean checkDouble(String num){            
 
        boolean intt=false;
        int point=0;
        if(num.length()<10){
        for(int i=0; i<num.length(); i++){
           char c=num.charAt(i);
           if((c>=48&&c<=57)||c==46){
               if(c==46){
                   point++;
                   if(point>1){
                       return false;
                   }
               }
               intt=true;
           }
           else
               return false;
      }       
        }
        return intt;
        
    }
    //--------------------------------------------------------------------------
  
    public boolean checkTel(String num){      
 
        boolean intt=false;
        if(num.length()==11){
        for(int i=0; i<num.length(); i++){
           char c=num.charAt(i);
           if(c>=48&&c<=57)
               intt=true;
           else
               return false;
      }       
        }
        return intt;
        
    }
        //--------------------------------------------------------------------------
  
    public boolean checkSSN(String num){      
 
        boolean intt=false;
        if(num.length()==11){
        for(int i=0; i<num.length(); i++){
           char c=num.charAt(i);
           if(c>=48&&c<=57)
               intt=true;
           else
               return false;
      }       
        }
        return intt;
        
    }
//--------------------------------------------------------------------------
    
    public boolean checkMail(String mail){
        boolean at=false;
        boolean nok=false;
        for(int i=0; i<mail.length(); i++){
            char c=mail.charAt(i);
            if(c==64)
                at=true;
            if(c==46)
                nok=true;            
        }
        if(at==true&&nok==true)
            return true;       
        
        return false;
    }


//---------------------ADMIN METHODS------------------------------------//

 public ResultSet allBookings() throws SQLException {
        initializeJdbc();

        rs = st.executeQuery("select id,reservationid, firstname, lastname, hotelname, reservationdate,hotel.hotelid, hotelrooms.hotelid from user, hotel, reservation, hotelrooms where reservation.userid = user.id AND reservation.roomid = hotelrooms.roomid AND hotelrooms.hotelid = hotel.hotelid");
                                            
        
        if(rs.next())
        {
            return rs;
        }
        else return null;
    }


//--------------------------------------------------------------------------//

public int messageCount(int userid) throws SQLException {
        initializeJdbc();

        rs = st.executeQuery("select * from hotelmessage where isRead='0' AND isDeleted='0' AND hotelid IN(select hotelid from hotel where user_id='"+userid+"')");
         
        int count=0;
        rs.beforeFirst();
        while(rs.next())
        {
            count++;
        }
        return count;
       
    }

//--------------------------------------------------------------------------//

public ResultSet approvedHotels() throws SQLException {
        initializeJdbc();

        rs = st.executeQuery("select hotelid,hotelname,user_id,id,firstname,lastname,status,hotelphone from user,hotel where hotel.user_id = user.id AND hotel.status='1'");
                                            
        
        if(rs.next())
        {
            return rs;
        }
        else return null;
    }

//--------------------------------------------------------------------------//

public ResultSet commentWaitingApproval() throws SQLException {
        initializeJdbc();

        rs = st.executeQuery("select commentid, comment, rating,hotelid,id, hotel_hotelid,usercomments.user_id,isApproved,firstname,lastname,hotelname from user,hotel,usercomments where usercomments.user_id = user.id AND usercomments.hotel_hotelid = hotel.hotelid AND isApproved=0 ORDER BY commentid ASC");
                                            
        
        if(rs.next())
        {
            rs.beforeFirst();
            return rs;
        }
        else return null;
    }

//--------------------------------------------------------------------------//

public void hotelReject(String hotelid) throws SQLException {
        initializeJdbc();

        st.executeUpdate("DELETE FROM hotel where hotelid="+hotelid);
           
    }

//--------------------------------------------------------------------------//

public void hotelApprove(String hotelid) throws SQLException {
        initializeJdbc();

         st.executeUpdate("update hotel set status='1' where hotelid="+hotelid);
           
    }

//--------------------------------------------------------------------------//

public void commentAccept(String hotelid) throws SQLException {
        initializeJdbc();

        st.executeUpdate("update usercomments set isApproved='1' where commentid="+hotelid);
           
    }

//--------------------------------------------------------------------------//

public void commentReject(String hotelid) throws SQLException {
        initializeJdbc();

        st.executeUpdate("DELETE FROM usercomments where commentid="+hotelid);
       
 }

public ResultSet allUsers() throws SQLException {
        initializeJdbc();

        rs = st.executeQuery("select * from user");
        
        if(rs.next())
        {
            return rs;
        }
       return null;
 }
}