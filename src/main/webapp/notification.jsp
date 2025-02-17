<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in_sp_db.DB_Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal</title>
   	<link rel="stylesheet" href="style/notification.css">

</head>
<body>

    <nav class="navbar">
        <ul>
        <li><a href="home.jsp"> Home</a></li>
        <li><a href="explore.jsp">Explore</a></li>
          <li><a href="jobs.jsp">Jobs</a></li>
          <li><a href="notification.jsp">Notification</a></li>
      </ul>
     <a href="profile.jsp"> <img src="hackathon/user-solid.svg" alt="">  </a>
    </nav>

    <div class="job-cards-container">
        <div class="job-card">
            <h2>Software Testing Work</h2>
            <br><br>

            

            <form action="JobApplicationServlet" method="post">
            <div >
                <strong>Username:</strong> <input type="text" name="username" value="Vinay" readonly><br/><br/>
                <strong>Email:</strong> <input type="email" name="email" value="vinay123@example.com" readonly>
			</div>
               
                <div class="skills-section">
                    <strong>Skills:</strong>
                    <select name="skills" multiple disabled>
                        <option value="Python">Python</option>
                        <option value="Django">Django</option>
                        <option value="SQL">SQL</option>
                    </select>
                </div>

                <div class="buttons">
                    <button type="submit" name="status" value="Hired" class="hire">Hire</button>
                    <button type="submit" name="status" value="Rejected" class="reject">Reject</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>