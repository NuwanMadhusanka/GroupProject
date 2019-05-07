package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gp.service.DB;
import com.gp.service.Functions;


@WebServlet("/student_register_action")
public class StudentRegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//1.Get data from "student/register.jsp"
				String name=request.getParameter("name");
				String nic=request.getParameter("nic");
				String tel=request.getParameter("tel");
				String address=request.getParameter("address");
				String email=request.getParameter("email");
				String pwd=request.getParameter("password");
				String examDate=request.getParameter("examdate");
				String trialDate=request.getParameter("trialdate");
				
				//get package details
				ArrayList<String> pacId=new ArrayList<String>();//Store package id of student's following packages
				try {
				   Connection con1=DB.getConnection();
				   String sql1="SELECT pac_id,title FROM package";
				   Statement st1=con1.createStatement();
				   ResultSet rs1=st1.executeQuery(sql1);
				   String packageId="";//pack==>package
				   while(rs1.next()) {
					   packageId=request.getParameter(rs1.getString("title"));
					   if(packageId!=null) {
						   pacId.add(packageId);
						   //System.out.println(packageId);
					   }
				   }
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//select manual lesson and auto lesson with respect to selected package
				ArrayList<String> transmission=new ArrayList<String>();
				for(int i=0 ; i<pacId.size() ; i++) {
					String tra=request.getParameter(pacId.get(i));
					if(tra.equals("1")) {
						transmission.add(i,"1");
					}
					if(tra.equals("2")) {
						transmission.add(i,"2");
					}
				}
				
				
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
					
				if(pacId.size()==0) {
					error+="Select at least one package!";
				}
				
			
				//3.Add data to DataBase
				if(error.equals("")) {
					try {
						Connection con=DB.getConnection();
						
						//insert data to student
						String sql="INSERT INTO student (name,nic,tel,address,exam_date,trial_date) VALUES (?,?,?,?,?,?)";
						PreparedStatement ps=con.prepareStatement(sql);
						
						ps.setString(1, name);
						ps.setString(2, nic);
						ps.setString(3, tel);
						ps.setString(4, address);
						ps.setString(5,examDate);
						ps.setString(6,trialDate);
						
						ps.executeUpdate();
						
						//get Student id
						sql="SELECT stu_id FROM student WHERE nic=?";
						ps=con.prepareStatement(sql);
						ps.setString(1,nic);
						ResultSet rs=ps.executeQuery();
						
						if(rs.next()) {
							String stuId=rs.getString("stu_id");
							
							//insert data to user table
									
							sql="INSERT INTO user (email,password,role,stu_id,reg_date,status) VALUES (?,md5(?),?,?,now(),1)";
							ps=con.prepareStatement(sql);
							ps.setString(1, email);
							ps.setString(2, pwd);
							ps.setString(3, "5");
							ps.setString(4, stuId);
							
							ps.executeUpdate(); 
							
							//insert data to student_package table
							sql="INSERT INTO student_package (stu_id,pac_id,transmission,join_date) VALUES (?,?,?,now())";
							ps=con.prepareStatement(sql);
							ps.setString(1,stuId);
							for(int i=0 ; i<pacId.size() ; i++) {
								ps.setString(2,pacId.get(i));
								ps.setString(3,transmission.get(i));
								ps.execute();
							}
							
							response.sendRedirect("student/list.jsp?msg=success");
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else {
					response.sendRedirect("student/register.jsp?msg="+error);
				}

	}

}
