package com.sun.entity.data;

public class Function {
	String name;
	int isChoose;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIsChoose() {
		return isChoose;
	}
	public void setIsChoose(int isChoose) {
		this.isChoose = isChoose;
	}
	@Override
	public String toString() {
		return "Function [name=" + name + ", isChoose=" + isChoose + "]";
	}
	public Function() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Function(String name, int isChoose) {
		super();
		this.name = name;
		this.isChoose = isChoose;
	}
	
}
