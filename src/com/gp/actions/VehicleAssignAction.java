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


@WebServlet("/vehicle_assign_action")
public class VehicleAssignAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the data
		String insId=request.getParameter("insId");
		String vehId=request.getParameter("vehId");
		
		
		//validation
		String error="";
		if(insId.equals("0")) {
			error+="Must select instructor !";
		}
		if(vehId.equals("")) {
			error+="Error in vehicle id";
		}
		
		//save to db
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="UPDATE vehicle SET ins_id=? WHERE veh_id=?";
				PreparedStatement ps=con.prepareStatement(sql);
				if(insId.equals("-1")) {
					ps.setString(1,null);
				}else {
					ps.setString(1,insId);
				}
				ps.setString(2,vehId);
				ps.execute();
				
				response.sendRedirect("vehicle/list_assign.jsp?msg=success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("vehicle/list_assign.jsp?msg="+error);
		}
	}

}
