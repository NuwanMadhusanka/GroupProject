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


@WebServlet("/user_blcklist_action")
public class UserBlackListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Get Id
		String id=request.getParameter("id");
		
		//DB 
		try {
			Connection con=DB.getConnection();
			String sql="UPDATE user SET status=? WHERE id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,"0");
			ps.setString(2,id);
			ps.execute();
			
			HttpSession session=request.getSession();
			String roleCurrent=session.getAttribute("role").toString();//current login user role
			
			
			//get changing user's role
			sql="SELECT role FROM user WHERE id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String roleUser=rs.getString("role");
				if(roleCurrent.equals("1")) {
					if(roleUser.equals("5")) {
						response.sendRedirect("student/list.jsp?msg=success");
					}else {
						response.sendRedirect("staff/list.jsp?msg=success");
					}
				}else if(roleCurrent.equals("2")) {
					response.sendRedirect("student/list.jsp?msg=success");
				}else if(roleCurrent.equals("3")) {
					response.sendRedirect("instructor/list.jsp?msg=success");
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
