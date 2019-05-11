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


@WebServlet("/staff_leave_add_action")
public class StaffLeaveAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId=request.getParameter("userId");
		String reason=request.getParameter("reason");
		
		//save database
		try {
			Connection con=DB.getConnection();
			
			//get the employee id
			String sql="SELECT emp_id FROM user WHERE id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String empId=rs.getString("emp_id");
				
				//insert data
				sql="INSERT INTO `leave` (reason,emp_id,date) VALUES (?,?,now())";
				ps=con.prepareStatement(sql);
				ps.setString(1,reason);
				ps.setString(2,empId);
				ps.execute();
				
				response.sendRedirect("leave/list.jsp?msg=success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
