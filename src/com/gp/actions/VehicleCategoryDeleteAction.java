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


@WebServlet("/vehiclecategory_delete_action")
public class VehicleCategoryDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Get data
		String id=request.getParameter("id");
		
		if(!id.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="DELETE FROM vehicle_category WHERE cat_id=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,id);
				ps.execute();
				
				response.sendRedirect("vehicle_category/list.jsp?msg=success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("vehicle_category/list.jsp?msg=Error");
		}
	}

}
