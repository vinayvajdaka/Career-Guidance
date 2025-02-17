<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Website Overview</title>
    <link rel="stylesheet" href="style/jobs_nav.css">
   
    <style type="text/css">
    
    @charset "UTF-8";


body {
    background-color: #0D0B07;
    color: #C4B7A6;
    font-family: sans-serif;
    margin: 0;
    padding: 0;
}

header {
    text-align: center;
    padding: 20px;
    background-image: url("https://source.unsplash.com/random/1600x900/?technology");
    background-size: cover;
    background-position: center;
    color: white;
}

h1 {
    color: #F5E9D8;
    font-size: 2.5em;
}

h2 {
    color: #F5E9D8;
    font-size: 2em;
    text-align: center;
}

section {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

ul, ol {
    line-height: 1.6;
}

a {
    color: #F5E9D8;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

footer {
    text-align: center;
    padding: 10px;
    background: #1A1814;
}
.links{
    display: flex;
    align-items: center;
    justify-content: center;
}

    
    
    
    </style>
   
    
</head>
<body>
<%
String message=(String)session.getAttribute("login");
if(message!=null){
	%>
	<script>
	alert("<%=message %>");
	</script>
	<% 
	session.removeAttribute("login");
}


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
    <header>
        <h1>Welcome to Our Platform</h1>
        <p>Empowering you with seamless opportunities—explore, connect, and grow!</p>
    </header>
    
    <section id="features">
        <h2>Features</h2>
        <ul>
            <li><strong>Job Listings:</strong> Browse and apply for jobs.</li>
            <li><strong>Comments & Feedback:</strong> Engage with other users through comments.</li>
            <li><strong>Explore:</strong> Discover new opportunities and features.</li>
        </ul>
    </section>
    
    <section id="how-to-use">
        <h2>How to Use</h2>
        <ol>
            <li>Sign in to your account.</li>
            <li>Explore job listings and apply.</li>
            <li>Leave comments and interact with others.</li>
            <li>Use the explore section to find new opportunities.</li>
        </ol>
    </section>
    
    <section id="quick-links">
        <h2>Quick Links</h2>
        <div class="links">
        <a href="jobs.jsp">Jobs</a> | 
        <a href="explore.jsp">Explore</a>
    </div>
    </section>
    
    <footer>
        <p>&copy; 2025 Your Website Name. All rights reserved.</p>
    </footer>
</body>
</html>