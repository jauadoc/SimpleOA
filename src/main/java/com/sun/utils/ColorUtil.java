package com.sun.utils;

import java.util.Random;

public class ColorUtil {
	/**
	 * 获取50-205之间rgb随机颜色
	 * @return
	 */
	public static String getRandomColor(){
		String color ="";
		String colorRed = "";
		String colorGreen = "";
		String colorBlue = "";

		colorRed = getRandomNum()+"";
		colorGreen = getRandomNum()+"";
		colorBlue = getRandomNum()+"";
		color += colorRed + "," +colorGreen + "," + colorBlue;
		return color;
	}
	
	/**
	 * 返回50-205之间的rgb数值
	 * @return
	 */
	public static int getRandomNum(){
		int num = 0;
		num += (new Random().nextInt(155))+50;
		return num;
	}
	
	/**
	 * 获取暖色系随机rgb颜色数值
	 */
	public static String getWarmRandomColor(){
		String color ="";
		String colorRed = "";
		String colorGreen = "";
		String colorBlue = "";

		colorRed = getRandomNum()+50+"";
		colorGreen = getRandomNum()+"";
		colorBlue = getRandomNum()-50+"";
		color += colorRed + "," +colorGreen + "," + colorBlue;
		return color;
	}
	
	/**
	 * 获取冷色系随机rgb颜色数值
	 */
	public static String getColdRandomColor(){
		String color ="";
		String colorRed = "";
		String colorGreen = "";
		String colorBlue = "";

		colorRed = getRandomNum()-50+"";
		colorGreen = getRandomNum()+"";
		colorBlue = getRandomNum()+50+"";
		color += colorRed + "," +colorGreen + "," + colorBlue;
		return color;
	}
	
	/**
	 * 获取浅色色系随机rgb颜色数值
	 */
	public static String getLittleRandomColor(){
		String color ="";
		String colorRed = "";
		String colorGreen = "";
		String colorBlue = "";

		colorRed = getRandomNum()+50+"";
		colorGreen = getRandomNum()+50+"";
		colorBlue = getRandomNum()+50+"";
		color += colorRed + "," +colorGreen + "," + colorBlue;
		return color;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getWarmRandomColor());
	}

}
