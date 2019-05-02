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


@WebServlet("/student_edit_action")
public class StudentEditAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//1.Get data from "adminStaff/edit.jsp"
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String nic=request.getParameter("nic");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		
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
		
		if(!pwd.equals("") && pwd.length()<8) {
			error+="Password must be 8 charecter or more!<br>";
		}
		
		
		
		
		//3.Add data to DataBase
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				
				
				//get Employee id
				String sql="SELECT stu_id FROM user WHERE id=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,id);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()) {
					String stuId=rs.getString("stu_id");
					
					
					//insert data to user table
					if(pwd.equals("")) {
						sql="UPDATE  user SET email=? WHERE id=?";
						ps=con.prepareStatement(sql);
						ps.setString(1,email);
						ps.setString(2, id);
					}else {
						sql="UPDATE  user SET email=?,password=md5(?) WHERE id=?";
						ps=con.prepareStatement(sql);
						ps.setString(1,email);
						ps.setString(2,pwd);
						ps.setString(3, id);
					}
					
					ps.executeUpdate(); 
					
					//insert data to student table
					sql="UPDATE student SET name=?,nic=?,tel=?,address=? WHERE stu_id=?";
					ps=con.prepareStatement(sql);
					
					ps.setString(1, name);
					ps.setString(2, nic);
					ps.setString(3, tel);
					ps.setString(4, address);
					ps.setString(5,stuId);
					
					ps.executeUpdate();
														
					response.sendRedirect("student/list.jsp?msg=success");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("student/list.jsp?msg="+error);
		}
	}

}
