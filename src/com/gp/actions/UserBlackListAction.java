package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
			String role=session.getAttribute("role").toString();
			if(role.equals("1")) {
				response.sendRedirect("staff/list.jsp?msg=success");
			}else if(role.equals("2")) {
				response.sendRedirect("student/list.jsp?msg=success");
			}else if(role.equals("3")) {
				response.sendRedirect("instructor/list.jsp?msg=success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
