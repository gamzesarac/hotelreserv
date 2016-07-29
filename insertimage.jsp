<%@page import="db.user"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%@ include file="getcon.jsp"%> <!-- to connect a database-->
<%
if(session.getAttribute("username") == null){
        response.sendRedirect("../login.html");
    }
%>

<%
String hotelID = null;

user u = new user();
String randomName = u.randomName()+".jpg";  // resim isimleri çakışmaması için random isim oluşturuyor
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
    if(item.getFieldName().equals("hotelID"))
        {   
          hotelID=item.getString();
          
        }
String name = item.getFieldName();
String value = item.getString();
if(name.equals("ImageFile"))
{
ImageFile=value;
}
 
}
else
{
try
{
itemName = randomName;
File savedFile = new File(config.getServletContext().getRealPath("/")+"/hotelimages\\"+itemName);

item.write(savedFile);
}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
try
{
int i = st.executeUpdate("insert into hotelimage(imageaddress,hotel_hotelid) values ('hotelimages/"+itemName+"','"+hotelID+"')");
 if(i==1)
 {
     out.print("Image Upload Successfully  ");
     out.print("<a href='javascript:history.back()'>Click Here Go Back</a>");
 }
}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>