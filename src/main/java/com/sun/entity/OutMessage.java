package com.sun.entity;

public class OutMessage {
	String status;
	String data;
	String date;
	int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "OutMessage [status=" + status + ", data=" + data + ", date="
				+ date + ", count=" + count + "]";
	}
	public OutMessage(String status, String data, String date) {
		super();
		this.status = status;
		this.data = data;
		this.date = date;
	}
	
	public OutMessage(String status, String data, String date, int count) {
		super();
		this.status = status;
		this.data = data;
		this.date = date;
		this.count = count;
	}
	public OutMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
