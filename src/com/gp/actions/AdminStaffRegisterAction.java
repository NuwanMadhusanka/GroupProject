package com.gp.actions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
		//2.Do validation
		String error="";
		
		if(name.equals("")) {
			error+="Name can't be empty!";
		}
		
		
	}

}
