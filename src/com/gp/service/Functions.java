package com.gp.service;

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
	
}
