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
import javax.servlet.http.HttpSession;

import com.gp.service.DB;


@WebServlet("/lesson_book_action")
public class LessonBookAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get data from lesson/book.jsp
		String packageId=request.getParameter("package");
		String timeSlotId=request.getParameter("time");
		String date=request.getParameter("date");//booking date
		String lesId="";
		
		//validation
		String error="";
		if(packageId.equals("0")) {
			error+="Must select package!<br>";
		}
		if(timeSlotId.equals("0")) {
			error+="Must Select TimeSlot!<br>";
		}
		if(date==null || date.equals("")) {
			error+="Must Select Date!<br>";
		}
		
		//get lesson id
		try {
			lesId=request.getParameter("lesson");
			if(lesId.equals("")) {
				error+="There is some problem selected lesson.";
			}
		} catch (Exception e) {
			error+="Must Fill All!";
		}
		
		//get the user id
		HttpSession sesson=request.getSession();
		String id=sesson.getAttribute("id").toString();
		String stuId="";
		
		
		
		
		//get the student number of lesson student done(Specific package)
		boolean isLessonRemain=false;
		boolean isAlreadyBookLesson=false;
		try {
			Connection con=DB.getConnection();
			//get the student id
			String sql="SELECT stu_id FROM user WHERE id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				stuId=rs.getString("stu_id");
				
				//check the record already in the table
				sql="SELECT count(date) FROM student_lesson WHERE stu_id=? AND les_id=?";
				ps=con.prepareStatement(sql);
				ps.setString(1,stuId);
				ps.setString(2,lesId);
				rs=ps.executeQuery();
				if(rs.next()) {
					
					int isAlreadyBook=rs.getInt("count(date)");
					
					if(isAlreadyBook==0) {
						sql="SELECT count(student_lesson.date) as numDoneLesson,package.manual_les,package.auto_les,student_package.transmission FROM student_lesson,package,lesson,student_package "+
								"WHERE student_lesson.les_id=lesson.les_id AND "+
								"lesson.pac_id=package.pac_id AND "+
								"student_lesson.stu_id=student_package.stu_id AND "+
								"student_package.pac_id=package.pac_id AND "+
								"student_lesson.les_id=? AND student_lesson.stu_id=? ";
							
							ps=con.prepareStatement(sql);
							ps.setString(1,lesId);
							ps.setString(2,stuId);
							rs=ps.executeQuery();
							if(rs.next()) {
								int lesDone=rs.getInt("numDoneLesson");
								int autoLes=rs.getInt("auto_les");
								int manualLes=rs.getInt("manual_les");
								int transmission=rs.getInt("transmission");
								
								//When not any record insert into student_lesson table
								if(lesDone==0 && autoLes==0 && manualLes==0 && transmission==0) {
									isLessonRemain=true;
								}
								
								//When any record insert into student_lesson table
								if(transmission==1) {//transmission ==1-->manual 
									if(lesDone<manualLes) {
										isLessonRemain=true;
									}
								}else if(transmission==2){//transmission ==2-->Auto
									if(lesDone<autoLes) {
										isLessonRemain=true;
									}
								}
							}
					}else {
						error+="You already book that lesson<br>";
						isAlreadyBookLesson=true;
					}
					
				
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//save to database
		if(error.equals("") && isLessonRemain) {
			try {
				Connection con1=DB.getConnection();
				String sql1="INSERT INTO student_lesson (les_id,stu_id,date) VALUES (?,?,now()) ";
				PreparedStatement ps1=con1.prepareStatement(sql1);
				ps1.setString(1,lesId);
				ps1.setString(2,stuId);
				ps1.execute();
					
				response.sendRedirect("lesson/booking_list.jsp?msg=Success!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(!isLessonRemain && !isAlreadyBookLesson){
			response.sendRedirect("lesson/booking.jsp?msg=You already done the all the lesson in this package.You cannot book in this package.");
		}else if(isAlreadyBookLesson){
			response.sendRedirect("lesson/booking.jsp?msg="+error);
		}else {
			response.sendRedirect("lesson/booking.jsp?msg="+error);
		}
	}

}
