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



@WebServlet("/complain_add_action")
public class ComplainAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title=request.getParameter("title");
		String complain=request.getParameter("complain");
		
		//get the user id
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		
		//save db
		String empId="";
		try {
			Connection con=DB.getConnection();
			
			//get the employee id
			String sql="SELECT emp_id FROM user WHERE id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				empId=rs.getString("emp_id");
			}
			
			sql="INSERT INTO complain (title,complain,emp_id,view,reply,date) VALUES(?,?,?,'0','0',now())";
			ps=con.prepareStatement(sql);
			ps.setString(1,title);
			ps.setString(2,complain);
			ps.setString(3,empId);
			ps.execute();
			response.sendRedirect("complain/staff_list.jsp?msg=success");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
