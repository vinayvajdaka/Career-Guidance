<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in_sp_db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style/learn.css" />
    <link rel="stylesheet" href="Style/jobsnav.css">
  </head>
  <body>
  <%
     System.out.print( request.getParameter("id"));
  	int id=Integer.parseInt( request.getParameter("id"));  
  Connection conn = DB_Connection.getconnection();
  String query = "select c_name,v_link,g_link from explore where c_id =? ";
  PreparedStatement ps = conn.prepareStatement(query);
  ps.setInt(1, id);
  
  ResultSet rs = ps.executeQuery();
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
    <h1 style="text-align: center;"></h1>
    <% if(rs.next()){ %>
    <h1 style="text-align:center"><%=rs.getString("c_name") %></h1>
    <div class="container"><div>
            <h1>Learn Via Graphics</h1>
           <a href="<%=rs.getString("v_link")%>"><img src="img/youtube-brands-solid (2).svg"  alt="" srcset=""></a> 
        </div>
        <div>
            <h1>Learn Via Code</h1>
           <a href="<%=rs.getString("g_link")%>"> <img src="img/geeks.jpg" " alt="" srcset=""></a>
        </div>
        <%} %>
    </div>
    <div style="display:flex; justify-content:center; height:30vh; align-items:center;"><a href="comment.jsp" style="text-decoration:none; background:#E3B23C; color:black;">Add Comment</a></div>
  </body>
</html>