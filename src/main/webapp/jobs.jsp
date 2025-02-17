<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in_sp_db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html!>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
    href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Mukta:wght@200;300;400;500;600;700;800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Sarina&display=swap"
    rel="stylesheet"
/>
  <link rel="stylesheet" href="style/jobs_nav.css">
  <style>
  
  * {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: #F4F4F4;  /* Dark Theme */
    color: #D4C4B0;  /* Gold Text */
}

.hero {
    margin: 40px auto;
    display: grid;
    grid-template-columns: 1fr 1fr;
    row-gap: 20px;
    column-gap: 30px;
    width: 90%;
    max-width: 1200px;
}

.card {
    background: #181818;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    transition: 0.3s;
}

.card:hover {
    transform: scale(1.02);
    box-shadow: 0px 4px 15px rgba(227, 178, 60, 0.5);
}

.card h1 {
    text-transform: capitalize;
    font-size: 22px;
    margin-bottom: 10px;
}

.card p {
    font-size: 15px;
    text-align: left;
    line-height: 1.5;
}

.card .cardinfo button {
    height: 40px;
    width: 100px;
    background-color: #E3B23C; /* Gold Button */
    border-radius: 20px;
    color: black;
    border: none;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.card .cardinfo button:hover {
    background-color: #C9971A; /* Darker Gold */
    
}
.card .cardinfo button a{
text-decoration:none;
color:black;
}

.add{
display:block;
width:30vw;
text-align:center;
margin:20px auto;
font-size:25px;
}
.add a{
padding:10px;
border-radius: 20px;
background:black;
color:#E3B23C;
text-decoration : none;
width:60px;
}
 </style>
    
  </head>
  <body>
  <%
String message=(String)session.getAttribute("jobs_status");
if(message!=null){
	%>
	<script>
	alert("<%=message %>");
	</script>
	<% 
	session.removeAttribute("jobs_status");
}


%>
  <% Connection con=DB_Connection.getconnection();
     String q="select j_id, j_desc,j_title from jobs" ;
     PreparedStatement ps=con.prepareStatement(q);
      ResultSet rs= ps.executeQuery();
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
    
	<div class="add"><a href="addjob.jsp">Add Job</a></div> 
    <div class="hero">
      
         <%while(rs.next()){ 
        	 
         int id = rs.getInt("j_id");
         
         %>
      <div class="card">
        <div class="cardtext">
          <h1><%=rs.getString("j_title") %></h1>
          <p>
               <%= rs.getString("j_desc") %>
          </p>
        </div>
       
       
        <div class="cardinfo">
        
         <button><a href="profile.jsp?id=<%=id %>">Apply</a></button>
         
        </div>
      </div>
      <%} %>
      </div>
   
     
     
  </body>
</html>