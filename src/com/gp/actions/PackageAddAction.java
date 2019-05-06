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


@WebServlet("/package_add_action")
public class PackageAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.Get data
		String title=request.getParameter("title");
		String price=request.getParameter("price");
		String des=request.getParameter("description");
		String catId=request.getParameter("category");
		
		String checkManual=request.getParameter("checkManual");
		String manualLes="0";
		boolean manualFlag=false;
		if(checkManual!=null && checkManual.equals("1")) {
			manualFlag=true;
			manualLes=request.getParameter("manual");
		}
		
		String checkAuto=request.getParameter("checkAuto");
		String autoLes="0";
		boolean autoFlag=false;
		if(checkAuto!=null && checkAuto.equals("2")) {
			autoFlag=true;
			autoLes=request.getParameter("auto");
		}
		
		String url=request.getParameter("url");
		
		//2.validation
		String error="";
		if(title.equals("")) {
			error+="Title can't be empty!<br>";
		}
		
		int value=0;
		if(price.equals("")) {
			error+="Price can't be empty!<br>";
		}else {
			try {
				value=Integer.parseInt(price);
			} catch (Exception e) {
				error+="Enter Valid Number!<br>";
			}
		}
		
		if(des.equals("")) {
			error+="Insert description about package!<br>";
		}
		
		if(catId.equals("0")) {
			error+="Select the vehicle Category!<br>";
		}
		
		//validate auto/manual lessons
		if(!manualFlag && !autoFlag) {
			error+="Insert number of lessons(Manual/Auto)<br>";
		}
		
		if(manualFlag) {
			if(manualLes.equals("0")) {
				error+="Enter Number of Manual lessons!";
			}else {
				try {
					int num=Integer.parseInt(manualLes);
				} catch (Exception e) {
					error+="Enter Valid Number of manual lessons.";
				}
			}
		}
		
		if(autoFlag) {
			if(autoLes.equals("0")) {
				error+="Enter Number of Auto lessons!";
			}else {
				try {
					int num=Integer.parseInt(autoLes);
				} catch (Exception e) {
					error+="Enter Valid Number of Auto lessons.";
				}
			}
		}
		
	
		
		//3.DB Connection
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="INSERT INTO package (title,cat_id,description,price,url,manual_les,auto_les,status) "+
						   "VALUES (?,?,?,?,?,?,?,1)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,title);
				ps.setString(2,catId);
				ps.setString(3,des);
				ps.setString(4,price);
				ps.setString(5,url);
				ps.setString(6,manualLes);
				ps.setString(7,autoLes);
				
				ps.executeUpdate();
				
				response.sendRedirect("package/list.jsp?msg=success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("package/add.jsp?msg="+error);
		}
	}

}
