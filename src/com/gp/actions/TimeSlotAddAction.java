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


@WebServlet("/time_slot_add_action")
public class TimeSlotAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String sTime=request.getParameter("sTime");
		String fTime=request.getParameter("fTime");
		
		//save db
		try {
			Connection con=DB.getConnection();
			String sql="INSERT INTO time_slot (s_time,f_time) VALUES(?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,sTime);
			ps.setString(2,fTime);
			ps.execute();
			
			response.sendRedirect("time_slot/list.jsp?msg=success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
