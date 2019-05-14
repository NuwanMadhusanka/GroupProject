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


@WebServlet("/lesson_add_action")
public class LessonAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dayId=request.getParameter("day");
		String timeSlotId=request.getParameter("time");
		String packageId=request.getParameter("package");
		String transmission=request.getParameter("transmission");
		String insId=request.getParameter("instructor");
		String numStudent=request.getParameter("numStu");
		String pathUrl=request.getParameter("pathUrl");
		
		//validation
		String error="";
		if(dayId.equals("0")) {
			error+="Must Select Day!<br>";
		}
		if(timeSlotId.equals("0")) {
			error+="Must Slect time slot!<br>";
		}
		if(packageId.equals("0")) {
			error+="Must Select Package!<br>";
		}
		if(transmission==null) {
			error+="Must Select Transmission<br>";
		}
		if(insId==null || (insId.equals("0"))) {
			error+="Must Select Instructor<br>";
		}
		if(numStudent.equals("")) {
			error+="Must Fill Number Of Student<br>";
		}
		
		//not complete
		pathUrl="0";
		if(pathUrl.equals("0")) {
			pathUrl=null;
		}
		
		//save to db
		if(error.equals("")) {
			try {
				Connection con=DB.getConnection();
				String sql="INSERT INTO lesson (day,type,num_stu,ins_id,time_slot_id,path_id,pac_id) VALUE (?,?,?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,dayId);
				ps.setString(2,transmission);
				ps.setString(3,numStudent);
				ps.setString(4,insId);
				ps.setString(5,timeSlotId);
				ps.setString(6,pathUrl);
				ps.setString(7,packageId);
				
				ps.execute();
				response.sendRedirect("lesson/list.jsp?msg=success");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("lesson/add.jsp?msg="+error);
		}
		
	}

}
