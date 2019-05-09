package com.gp.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gp.service.DB;


@WebServlet("/payment_add_action")
public class PaymentAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get value from payment/add.jsp
		String stuId=request.getParameter("stuId");
		String pacId=request.getParameter("pacId");
		Double amount=Double.parseDouble(request.getParameter("amount"));
		
		System.out.println(stuId);
		System.out.println(pacId);
		System.out.println(amount);
	
		//validation
		String error="";
		if(amount<0) {
			error+="Insert Valid amount";
		}
		
		if(error.equals("")) {
			Double packagePrice=0.0;
			Double totalPay=0.0;
			try {
				Connection con=DB.getConnection();
				String sql="SELECT amount FROM course_fee WHERE pac_id=? AND stu_id=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,pacId);
				ps.setString(2,stuId);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					totalPay+=rs.getDouble("amount");
				}
				
				//get package price 
				sql="SELECT price FROM package WHERE pac_id=?";
				ps=con.prepareStatement(sql);
				ps.setString(1,pacId);
				rs=ps.executeQuery();
				if(rs.next()) {
					packagePrice=Double.parseDouble(rs.getString("price"));
				}
				
				Double balance=packagePrice-totalPay;
				System.out.println(balance);
				if(balance>=amount) {
					//save to database
					sql="INSERT INTO course_fee (stu_id,pac_id,amount,date) VALUES(?,?,?,now())";
					ps=con.prepareStatement(sql);
					ps.setString(1,stuId);
					ps.setString(2,pacId);
					ps.setDouble(3,amount);
					ps.execute();
					
					response.sendRedirect("student/list.jsp?msg=success");
				}else {
					error+="Insert right amount.";
					response.sendRedirect("student/list.jsp?msg=Don't inert amount more than "+balance);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("student/list.jsp?msg=Insert Correct amount");
		}
		
	}

}
