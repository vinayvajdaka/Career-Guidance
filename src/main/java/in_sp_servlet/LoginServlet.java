package in_sp_servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con = in_sp_db.DB_Connection.getconnection();
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) { // User found
                HttpSession session = req.getSession();
                session.setAttribute("login", "welcome "+rs.getString("u_name"));
                resp.sendRedirect("home.jsp"); 
                session.setAttribute("u_id", rs.getString("u_id"));
                session.setAttribute("uname", rs.getString("u_name"));
                session.setAttribute("email", rs.getString("email"));
                
                
               
            } else { // Invalid login
                HttpSession session = req.getSession();
                session.setAttribute("login", "Invalid email or password!");
                resp.sendRedirect("Login.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('Error: " + e.getMessage().replace("'", "\\'") + "');");
            out.write("window.location='Login.jsp';");
            out.write("</script>");
        }
    }
}