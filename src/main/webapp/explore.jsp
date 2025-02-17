
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in_sp_db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Mukta:wght@200;300;400;500;600;700;800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Sarina&display=swap"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="style/explore.css">
     <link rel="stylesheet" href="style/jobs_nav.css">
   
</head>
<body>
<%
   Connection con=DB_Connection.getconnection();
String q="select c_id,c_name,I_path,desc1 from explore";

   PreparedStatement ps=con.prepareStatement(q);
   ResultSet rs=ps.executeQuery();
%>
    <div class="navbar">
        <ul>
          <li><a href="home.jsp"> Home</a></li>
        <li><a href="explore.jsp">Explore</a></li>
          <li><a href="jobs.jsp">Jobs</a></li>
           <li><a href="notification.jsp">Notification</a></li>
        </ul>
         <a href="profile.jsp"> <img src="hackathon/user-solid.svg" alt="">  </a>
      </div> 
      <div class="sidebar">
        <div><a href="">All Topics</a></div>
        <div><a href="">Ai</a></div>
        <div><a href="">Full stack Developer</a></div>
        <div><a href="">Data analytics</a></div>
        <div><a href="">Cyber Security</a></div>
        <div><a href="">Data Science</a></div>
        <div><a href="">Database Connectivity</a></div>
        <div><a href="">Using API's</a></div>
      </div>
      <div class="main">
        <div class="container">
        <%while(rs.next()) {%>
            <div class="card">
                <img src="course_img/<%=rs.getString("I_path")%>" alt="">
                <h1><%=rs.getString("c_name") %></h1>
                <p><%=rs.getString("desc1") %></p>
                <% 
                int id=rs.getInt("c_id"); %>
                <button><a href="learn.jsp?id=<%=id %>">Learn</a></button>
            </div>
            <%} %>
        </div>	
      </div>
</body>
</html>