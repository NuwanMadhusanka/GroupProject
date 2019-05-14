package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gp.service.DB;


@WebServlet("/vehicle_delete_action")
public class VehicleDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//get data
		String vehId=request.getParameter("id");
		
		if(!vehId.equals("")) {
			//db
			try {
				Connection con=DB.getConnection();
				String sql="DELETE FROM vehicle WHERE veh_id=?";
				
				//I have to concern the vehicle maintainance details
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			
		}
	}

}
