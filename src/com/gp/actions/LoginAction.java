package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gp.service.DB;

@WebServlet("/login_action")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get data from login form
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		
		//validate data
		String error="";
		if(email.equals("")) {
			error+="Email address can't be empty.!<br>";
		}
		if(pwd.equals("")) {
			error+="Password can't be empty.!<br>";
		}
		
		if(error.equals("")) {
			//Verify authorization
			try {
				Connection con=DB.getConnection();
				String sql="SELECT * FROM user WHERE email=? AND password=md5(?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,email);
				ps.setString(2,pwd);
				ResultSet rs=ps.executeQuery();
				
				
				if(rs.next()) {
					String id=rs.getString("id");
					String role=rs.getString("role");
					String status=rs.getString("status");
					
					
					if(status.equals("1")) {
						//Session Handling
						HttpSession session=request.getSession();
						session.setAttribute("id",id);
						session.setAttribute("role",role);
						
						response.sendRedirect("main.jsp?msg=success");
					}else {
						response.sendRedirect("login.jsp?msg=Access Denied!");
					}
				}else {
					response.sendRedirect("login.jsp?msg=Your haven't account.Please inform the administrator.");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("login.jsp?msg="+error);
		}
	}

}
