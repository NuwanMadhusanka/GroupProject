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


@WebServlet("/vehicle_add_action")
public class VehicleAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get data form "vehicle/add.jsp"
		String brand=request.getParameter("brand");
		String model=request.getParameter("model");
		String number=request.getParameter("number");
		String fuelType=request.getParameter("fueltype");
		String transmossion=request.getParameter("transmission");
		String category=request.getParameter("category");
		String doc=request.getParameter("lic");
		
		
		//validate
		String error="";
		if(brand.equals("")) {
			error+="Insert Valid Brand<br>";
		}
		if(model.equals("")) {
			error+="Insert Valid Model<br>";
		}
		if(number.equals("")) {
			error+="Insert Valid Vehicle Number<br>";
		}
		if(fuelType.equals("")) {
			error+="Insert Valid FuelType<br>";
		}
		if(transmossion.equals("0")) {
			error+="Select Valid transmission<br>";
		}
		if(category.equals("0")) {
			error+="Select Valid Category<br>";
		}
		
		
		//db
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="INSERT INTO vehicle (brand,model,number,fuel_type,transmission,document_lic,cat_id) "+
						    "VALUES (?,?,?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,brand);
				ps.setString(2,model);
				ps.setString(3,number);
				ps.setString(4,fuelType);
				ps.setString(5,transmossion);
				ps.setString(6,doc);
				ps.setString(7,category);
				
				
				ps.executeUpdate();
				response.sendRedirect("vehicle/list.jsp?msg=success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("vehicle/add.jsp?msg="+error);
		}
	}

}
