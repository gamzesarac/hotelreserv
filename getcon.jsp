<%@ page import="java.sql.*" %>
<%!Statement st=null;
Connection cn=null;
%>
<%
Class.forName("com.mysql.jdbc.Driver");
cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationdb","root","");

st=cn.createStatement();
%>