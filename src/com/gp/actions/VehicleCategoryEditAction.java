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


@WebServlet("/vehiclecategory_edit_action")
public class VehicleCategoryEditAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get data(vehicle_category/edit.jsp)
		String catId=request.getParameter("id");
		String category=request.getParameter("category");
		
		//Validation
		if(!category.equals("") && !catId.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="UPDATE vehicle_category SET category=? WHERE cat_id=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,category);
				ps.setString(2,catId);
				
				ps.executeUpdate();
				response.sendRedirect("vehicle_category/list.jsp?msg=success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("vehicle_category/list.jsp?msg=Enter Valid Category");
		}
	}

}
