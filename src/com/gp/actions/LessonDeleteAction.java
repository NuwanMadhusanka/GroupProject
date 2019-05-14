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

import com.gp.service.DB;


@WebServlet("/lesson_delete_action")
public class LessonDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String lesId=request.getParameter("id");
		
		try {
			Connection con=DB.getConnection();
			String sql="DELETE FROM lesson WHERE les_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,lesId);
			ps.execute();
			
			response.sendRedirect("lesson/list.jsp?msg=success");
			
		} catch (Exception e) {
			response.sendRedirect("lesson/list.jsp?msg=Error");
			
		}
	}

}
