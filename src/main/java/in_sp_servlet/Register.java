package in_sp_servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/RegisterServlet")
public class Register extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con=in_sp_db.DB_Connection.getconnection();
		String name=req.getParameter("username");
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		String q="insert into users(u_name,email,password) values (?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setNString(1, name);
			ps.setNString(2, email);
			ps.setNString(3, pass);
			
			int i=ps.executeUpdate();
			
			if(i>0) {
				HttpSession hs=req.getSession();
				hs.setAttribute("register", "Register SuccessFull");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
				rd.forward(req, resp);
			}
			else {
				HttpSession hs=req.getSession();
				hs.setAttribute("error", "Register failed ! please try again");
				RequestDispatcher rd=req.getRequestDispatcher("Register.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			HttpSession hs=req.getSession();
			hs.setAttribute("register", e.toString());
			RequestDispatcher rd=req.getRequestDispatcher("Register.jsp");
			rd.forward(req, resp);			
		}
		
	}
	

}
