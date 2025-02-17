<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in_sp_db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <style>
    /* Global Styles */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
}

/* Background & Body */
body {
    background-color: #0A0A0A;
    color: #EAEAEA;
}

/* Navbar */
.navbar {
    background-color: #1C1C1C;
    height: 8vh;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
}

.navbar ul {
    display: flex;
    list-style: none;
}

.navbar ul li {
    margin-right: 20px;
    font-size: 1.2em;
    cursor: pointer;
    transition: color 0.3s;
}

.navbar ul li:hover {
    color: #00A8E8;
}

.navbar img {
    height: 5vh;
}

/* Layout Container */
.container {
    display: flex;
    align-items: center;
    justify-content: space-around;
    min-height: 100vh;
}

/* Profile Section */
.hero {
    width: 30vw;
    display: flex;
    flex-direction: column;
    background: #1A1A1A;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
}

/* User Avatar */
.hero img {
    display: block;
    margin: auto;
    width: 80px;
    border-radius: 50%;
    padding: 10px;
    background-color: #292929;
    border: 2px solid #00A8E8;
}

/* Labels & Inputs */
label {
    font-size: 1.2em;
    margin-top: 10px;
    color: #B0B0B0;
}

input[type="text"], input[type="email"] {
    height: 40px;
    border-radius: 5px;
    outline: none;
    border: none;
    font-size: 1.1em;
    background: #292929;
    color: #EAEAEA;
    padding: 5px 10px;
    margin-top: 5px;
}

/* Skills List */
.hero ul {
    border-radius: 8px;
    list-style-type: none;
    font-size: 1.2em;
    padding: 10px;
    display: grid;
    grid-template-columns: repeat(auto-fill, 1fr);
    row-gap: 5px;
    margin-bottom: 10px;
    background-color: #292929;
    color: #00A8E8;
}

.hero ul li {
    justify-self: center;
}

/* Logout Button */
input[type="button"] {
	display:block;
    margin:15px auto;
    font-size: 1.2em;
    padding: 10px;
    border: none;
    border-radius: 10px;
    font-weight: bold;
    background: #FF3B30;
    color: white;
    cursor: pointer;
    transition: 0.3s;
}

input[type="button"]:hover {
    background: #FF5555;
}

/* Left Section (Spline Model) */
.left {
    width: 50vw;
    height: 100vh;
}

/* Background Z-index */
#bg {
    z-index: -1;
    position: absolute;
}

@charset "UTF-8";
.navbar{
    color: white;
    background-color: #1A1A1A;
    height: 8vh;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}
.navbar img{
    height: 5vh;
}
.navbar ul{
    display: flex;
    align-items: center;
    justify-content: space-around;
    list-style-type: none;
}
.navbar ul li{
    padding-right: 20px;
}
.navbar ul li a{
	text-decoration : none;
	color:white;
}
.container{
	background:#0d0d0d;
}
#email{
width:100%;
}
    </style>
</head>
<body>
<%
	int u_id = Integer.parseInt(session.getAttribute("u_id").toString());
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
    <div class="container">
       <div class="left">
            <script type="module" src="https://unpkg.com/@splinetool/viewer@1.9.68/build/spline-viewer.js"></script>
<spline-viewer url="https://prod.spline.design/UNlUG5AREY95m80s/scene.splinecode"></spline-viewer>

        </div>
    <div class="hero">
        <img src="hackathon/user-solid.svg" alt="" srcset="">
        <label for="username">Username</label>
        <input type="text" disabled id="username" name="username"   value="<%=session.getAttribute("uname") %>">
        <label for="email">Email</</label><br/>
        <input type="email" name="email" id="email" disabled value="<%=session.getAttribute("email") %>">
        <br/>
        <label for="skills">Skills:</label>
        
        <ul id="skills">
            <li>html</li>
            <li>css</li>
            <li>javascript</li>
            
        </ul>
        <a href="Logout"><input type="button" value="Log-out"></a>
    </div>
    
</div>
</body>
</html>