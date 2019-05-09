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


@WebServlet("/complain_delete_action")
public class ComplainDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String cmpId=request.getParameter("id");
		
		//db
		try {
			Connection con=DB.getConnection();
			String sql="DELETE FROM complain WHERE cmp_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,cmpId);
			ps.execute();
			
			response.sendRedirect("complain/admin_list.jsp?msg=success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
