package com.gp.actions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/payment_add_action")
public class PaymentAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get value from student/listadvance.jsp
		String stuId=request.getParameter("stu_id");
		String pacId=request.getParameter("pac_id");
		System.out.println(stuId);
		System.out.println(pacId);
	}

}
