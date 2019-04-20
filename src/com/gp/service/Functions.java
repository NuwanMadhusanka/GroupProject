package com.gp.service;

import java.util.Scanner;

public class Functions {
	
	public static void main(String []args) {
		Scanner in=new Scanner(System.in);
		System.out.println("Enter num:");
		String num=in.nextLine();
		
		if(tel(num)) {
			System.out.println("ok");
		}else {
			System.out.println("Not Ok");
		}
	}
	
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
	
}
