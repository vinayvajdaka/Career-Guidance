<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style/Login_register.css">
</head>
<body>
<%
String message=(String)session.getAttribute("register");
if(message!=null){
	%>
	<script>
	alert("<%=message %>");
	</script>
	<% 
	session.removeAttribute("register");
}


%>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="Register.jsp">Sign Up here</a></p>
    </div>
</body>
</html>