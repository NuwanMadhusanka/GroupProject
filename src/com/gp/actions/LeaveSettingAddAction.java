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


@WebServlet("/leave_setting_action")
public class LeaveSettingAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get data
		String nulLeave=request.getParameter("numLeave");
		String noPay=request.getParameter("nopay");
		
		//save db
		try {
			Connection con=DB.getConnection();
			String sql="UPDATE leave_setting SET num_leave=?,no_pay=? WHERE lea_set_id=1";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,nulLeave);
			ps.setString(2,noPay);
			ps.execute();
			
			response.sendRedirect("main.jsp?msg=success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
