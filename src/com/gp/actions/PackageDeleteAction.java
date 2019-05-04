package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gp.service.DB;

@WebServlet("/package_delete_action")
public class PackageDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String pacId=request.getParameter("id");
		
		try {
			Connection con=DB.getConnection();
			String sql="DELETE FROM package WHERE pac_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,pacId);
			
			ps.executeUpdate();
			
			response.sendRedirect("package/list.jsp?msg=success");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("package/list.jsp?msg=Error");
		}
	}

}
