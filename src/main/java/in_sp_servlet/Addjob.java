package in_sp_servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addjob")
public class Addjob extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		String dtls=req.getParameter("dtls");
		Connection con=in_sp_db.DB_Connection.getconnection();
		String q="insert into jobs(j_title,j_desc,u_id)  values(?,?,?)";
		HttpSession hs=req.getSession();
		try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, title);
			ps.setString(2, dtls);
			ps.setString(3, (String) hs.getAttribute("u_id"));
		  int i=	ps.executeUpdate();
		  if(i>0) {
			  
			  hs.setAttribute("jobs_status", "Job added successfully");
			  RequestDispatcher rd=req.getRequestDispatcher("jobs.jsp");
			  rd.forward(req, resp);
			  
		  }
		  else {
			  hs.setAttribute("jobs_status", "Some error occurs ! Please try again");
			  RequestDispatcher rd=req.getRequestDispatcher("addjob.jsp.jsp");
			  rd.forward(req, resp);
			  
		  }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
