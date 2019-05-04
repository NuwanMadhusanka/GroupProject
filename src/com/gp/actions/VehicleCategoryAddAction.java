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


@WebServlet("/vehiclecategory_add_action")
public class VehicleCategoryAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		//1.Get Data(vehicle_type/add.jsp)
		String category=request.getParameter("category");
		
		//validation
		if(!category.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="INSERT INTO vehicle_category (category) VALUES (?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,category);
				
				ps.executeUpdate();
				response.sendRedirect("vehicle_category/list.jsp?msg=success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("vehicle_category/add.jsp?msg=Enter Valid Category");
		}
	}

}
