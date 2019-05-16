package com.gp.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import javax.mail.internet.InternetAddress;

public class Functions {
	
	public static void main(String []args) {
		Scanner in=new Scanner(System.in);
		System.out.println("Enter num:");
//		String num=in.nextLine();
//		
//		if(tel(num)) {
//			System.out.println("ok");
//		}else {
//			System.out.println("Not Ok");
//		}
	}
	
	//NIC number validation function
	public static boolean nic(String num) {
		int len=num.length();
		if(len!=10) {
			return false;
		}
		
		char[] arr=num.toCharArray();
		for(int i=0 ; i<=8 ; i++) {
			if(!Character.isDigit(arr[i])) {
				return false;
			}
		}
		
		if(!Character.isDigit(arr[9])) {
			return true;
		}
		return false;
	}
	
	//Telephone number validation function
	public static boolean tel(String num) {
		int x=num.length();
		char[] arr=num.toCharArray();
		if(x!=10) {
			return false;
		}
		for(int i=0 ; i<10 ; i++) {
			if(!Character.isDigit(arr[i])) {
				return false;
			}
		}
		return true;
	}
	
	
	//Email Address validation function
	public static boolean emailValidator(String email) {
		boolean isValid=false;
		try {
			//
			// Create InternetAddress object and validated the supplied
			// address which is this case is an email address.
			InternetAddress internetAddress=new InternetAddress(email);
			internetAddress.validate();
			isValid=true;
		} catch (Exception e) {
			//
		}
		
		return isValid;
	}
	
	//License number validation function
		public static boolean lic(String num) {
			int len=num.length();
			if(len!=8) {
				return false;
			}
			
			char[] arr=num.toCharArray();
			for(int i=1 ; i<=7 ; i++) {
				if(!Character.isDigit(arr[i])) {
					return false;
				}
			}
			if(!Character.isDigit(arr[0])) {
				return true;
			}
			return false;
		}
		
		//validate the date
		public static int validateDate(String date) {
			String[] splitedDate = date.split("\\s+");
			
			String dayName=splitedDate[0];//Mon
			String month=splitedDate[1];//Jul
			int monthInt=getMonth(month);
			
			
			int dateVal=Integer.parseInt(splitedDate[2]);//15
			int year=Integer.parseInt(splitedDate[3]);//2019
			
			//Get current date
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
			String dateAsString = dateFormatter.format(new Date());//current date
			String[] currentDate=dateAsString.split("/");
			
			int currentDateVal=Integer.parseInt(currentDate[0]);//15
			int currentMonth=Integer.parseInt(currentDate[1]);//05
			int currentYear=Integer.parseInt(currentDate[2]);//2019
			
			
			//comprision date
			
			int value=1;//1-->No error    ,2-->booking day is today  ,0-->error
			if(currentYear>year) {
				value=0;
			}else if(currentYear==year) {
				if(currentMonth>monthInt) {
					value=0;
				}else if(currentMonth==monthInt) {
					if(currentDateVal>dateVal) {
						value=0;
					}else if(currentDateVal==dateVal) {
						value=2;
					}
				}
			}
			
			return value;
		}
		
		public static int getMonth(String month) {
			month=month.toLowerCase();
			if(month.contains("jan")) {
				return 1;
			}else if(month.contains("feb")) {
				return 2;
			}else if(month.contains("mar")) {
				return 3;
			}else if(month.contains("apr")) {
				return 4;
			}else if(month.contains("may")) {
				return 5;
			}else if(month.contains("jun")) {
				return 6;
			}else if(month.contains("jul")) {
				return 7;
			}else if(month.contains("aug")) {
				return 8;
			}else if(month.contains("sep")) {
				return 9;
			}else if(month.contains("oct")) {
				return 10;
			}else if(month.contains("nov")) {
				return 11;
			}
			return 12;
		
		}
		
		public static boolean timeGap(String currentTime,String timeSlot) {
			
			String[] currTime=currentTime.split(":");
			String[] timSlot=timeSlot.split(":");
			
			//current time int value
			int ch=Integer.parseInt(currTime[0]);//current hour
			int cm=Integer.parseInt(currTime[1]);//current minute
			
			//timeslot
			int th=Integer.parseInt(timSlot[0]);//time slot hour
			int tm=Integer.parseInt(timSlot[1]);//time slot minute
			
			int curTot=(ch*60)+cm;
			int timTot=(th*60)+tm;
			
			if((timTot-curTot)>=60) {
				return true;
			}
			
			return false;
		}
		
		
		//get the week day int value==>Mon-->1.......Sun-->7
		public static int getWeekDay(String day) {
			day=day.toLowerCase();
			if(day.equals("mon")) {
				return 1;
			}else if(day.equals("tue")) {
				return 2;
			}else if(day.equals("wed")) {
				return 3;
			}else if(day.equals("thu")) {
				return 4;
			}else if(day.equals("fri")) {
				return 5;
			}else if(day.equals("sat")) {
				return 6;
			}
			return 7;
		}
}
