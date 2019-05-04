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


@WebServlet("/package_edit_action")
public class PackageEditAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				//1.Get data
				String id=request.getParameter("id");
				String title=request.getParameter("title");
				String price=request.getParameter("price");
				String des=request.getParameter("description");
				String manualLes=request.getParameter("manual");
				String autoLes=request.getParameter("auto");
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
				
				
				if(manualLes!=null) {
					if(manualLes.equals("0")) {
						error+="Enter Number of Manual lessons!";
					}else {
						try {
							int num=Integer.parseInt(manualLes);
						} catch (Exception e) {
							error+="Enter Valid Number of manual lessons.";
						}
					}
				}else {
					manualLes="0";
				}
				
				if(autoLes!=null) {
					if(autoLes.equals("0")) {
						error+="Enter Number of Auto lessons!";
					}else {
						try {
							int num=Integer.parseInt(autoLes);
						} catch (Exception e) {
							error+="Enter Valid Number of Auto lessons.";
						}
					}
				}else {
					autoLes="0";
				}
				
				//3.DB Connection
				if(error.equals("")) {
					try {
						Connection con=DB.getConnection();
						String sql="UPDATE package SET title=?,description=?,price=?,url=?,manual_les=?,auto_les=? "+
									"WHERE pac_id=?";
						PreparedStatement ps=con.prepareStatement(sql);
						ps.setString(1,title);
						ps.setString(2,des);
						ps.setString(3,price);
						ps.setString(4,url);
						ps.setString(5,manualLes);
						ps.setString(6,autoLes);
						ps.setString(7,id);
						
						ps.executeUpdate();
						
						response.sendRedirect("package/list.jsp?msg=success");
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else {
					response.sendRedirect("package/list.jsp?msg="+error);
				}
	}

}
