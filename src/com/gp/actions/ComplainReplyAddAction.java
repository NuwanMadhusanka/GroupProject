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


@WebServlet("/complainreply_add_action")
public class ComplainReplyAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cmpId=request.getParameter("cmpId");
		String reply=request.getParameter("reply");
		
		//save database
		try {
			Connection con=DB.getConnection();
			String sql="UPDATE complain SET reply=?,view=? WHERE cmp_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,reply);
			ps.setString(2,"2");
			ps.setString(3,cmpId);
			ps.execute();
			
			response.sendRedirect("complain/admin_list.jsp?msg=success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
