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


@WebServlet("/adminstaff_register_action")
public class AdminStaffRegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1.Get data from "admin/register.jsp"
		String name=request.getParameter("name");
		String nic=request.getParameter("nic");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String type=request.getParameter("type");
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		String qul=request.getParameter("qualification");
		
		//2.Do validation
		String error="";
		
		if(name.equals("")) {
			error+="Name can't be empty!<br>";
		}
		
		if(!Functions.nic(nic)) {
			error+="Enter Correct NIC Number!<br>";
		}
		
		if(!Functions.tel(tel)) {
			error+="Enter Correct TelNumber!<br>";
		}
		
		if(!Functions.emailValidator(email)) {
			error+="Enter valid Email Address!<br>";
		}
		
		if(address.equals("")) {
			error+="Address Can't be empty!<br>";
		}
		
		if(type.equals("0")) {
			error+="Select the type!<br>";
		}
		
		if(pwd.length()<8) {
			error+="Password must be 8 charecter or more!<br>";
		}
		
		if(qul.equals("")) {
			error+="Insert at leat on qulification!";
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
				sql="SELECT emp_id FROM staff";
				ps=con.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()) {
					String empId=rs.getString("emp_id");
					
					//insert data to administrative_staff table
					sql="INSERT INTO administrative_staff (emp_id,type,quliification) VALUES (?,?,?)";
					ps=con.prepareStatement(sql);
					ps.setString(1,empId);
					ps.setString(2, type);
					ps.setString(3, qul);
					
					ps.executeUpdate();
					
					//get roll
					String roll="0";
					if(type.equals("1")) {
						roll="2";
					}else {
						roll="3";
					}
					
					//insert data to user table
					
					sql="INSERT INTO user (email,password,roll,emp_id,reg_date,status) VALUES (?,md5(?),?,?,now(),1)";
					ps=con.prepareStatement(sql);
					ps.setString(1, email);
					ps.setString(2, pwd);
					ps.setString(3, roll);
					ps.setString(4, empId);
					
					ps.executeUpdate(); 
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println(error);
		}

	}
		
}
