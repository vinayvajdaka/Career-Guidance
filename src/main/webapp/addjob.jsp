<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post a Job</title>
    <link rel="stylesheet" href="style/addjob.css">
    <link rel="stylesheet" href="style/jobs_nav.css">
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
    <div class="navbar">
         <ul>
        <li><a href="home.jsp"> Home</a></li>
        <li><a href="explore.jsp">Explore</a></li>
          <li><a href="jobs.jsp">Jobs</a></li>
          <li><a href="notification.jsp">Notification</a></li>
      </ul>
        <img src="hackathon/user-solid.svg" alt="">
    </div>

    <div class="form-container">
        <h2>Add a New Job</h2>
        <form action="addjob" method="post">
        <input type="text"  name="title" id="job-title" placeholder="Enter Job Title">
        <textarea id="job-description" name="dtls" placeholder="Enter Job Description"></textarea><br/>
        <button id="post-btn">Post</button>
        </form>
    </div>

</body>
</html>