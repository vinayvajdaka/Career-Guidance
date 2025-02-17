<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="style/Login_register.css">
    <script>
    document.querySelector("form").addEventListener("submit", function (event) {
        let password = document.querySelector("[name='password']").value;
        let confirmPassword = document.querySelector("[name='c_password']").value;
		
        if (password != confirmPassword) {
            event.preventDefault();
            alert("Passwords do not match! Redirecting to login page.");
        }
    });  
    </script>
</head>
<body>
<%
String message=(String)session.getAttribute("error");
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
        <h2>Sign Up</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
             <input type="password" name="c_password" placeholder="Confirm-Password" required>
            <input type="submit" value="Register">
        </form>
        <p>Already have an account? <a href="Login.jsp">Login here</a></p>
    </div>
</body>
</html>