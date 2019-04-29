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
import com.gp.service.Functions;


@WebServlet("/instructorstaff_register_action")
public class InstructorStaffRegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.Get data from "instructor/register.jsp"
		String name=request.getParameter("name");
		String nic=request.getParameter("nic");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		String lic=request.getParameter("licence");
		
		System.out.println(lic);
		
		//2.Do validation
		String error="";
		
		if(name.equals("")) {
			error+="Name can't be empty!<br>";
		}
		
		if(!Functions.nic(nic)) {
			error+="Enter Correct NIC Number!<br>";
		}
		
		if(!Functions.tel(tel)) {
			error+="Enter Correct TelPhone Number!<br>";
		}
		
		if(!Functions.emailValidator(email)) {
			error+="Enter valid Email Address!<br>";
		}
		
		if(address.equals("")) {
			error+="Address Can't be empty!<br>";
		}
		
		
		if(pwd.length()<8) {
			error+="Password must be 8 charecter or more!<br>";
		}
		
		if(!Functions.lic(lic)) {
			error+="Enter Correct Licence Number";
		}
		
		
		
		//3.Add data to DataBase
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				
				//insert data to staff table
				String sql="INSERT INTO staff (name,nic,tel,address) VALUES (?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(sql);
				
				ps.setString(1, name);
				ps.setString(2, nic);
				ps.setString(3, tel);
				ps.setString(4, address);
				
				ps.executeUpdate();
				
				//get Employee id
				sql="SELECT emp_id FROM staff WHERE nic=?";
				ps=con.prepareStatement(sql);
				ps.setString(1,nic);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()) {
					String empId=rs.getString("emp_id");
					
					//insert data to administrative_staff table
					sql="INSERT INTO instructor (emp_id,licence) VALUES (?,?)";
					ps=con.prepareStatement(sql);
					ps.setString(1,empId);
					ps.setString(2, lic);
					
					ps.executeUpdate();
					
					//get roll
					String role="4";
					
					
					//insert data to user table
					
					sql="INSERT INTO user (email,password,role,emp_id,reg_date,status) VALUES (?,md5(?),?,?,now(),1)";
					ps=con.prepareStatement(sql);
					ps.setString(1, email);
					ps.setString(2, pwd);
					ps.setString(3, role);
					ps.setString(4, empId);
					
					ps.executeUpdate(); 
					
					response.sendRedirect("instructor/list.jsp?msg=success");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("instructor/register.jsp?msg="+error);
		}
	}

}
