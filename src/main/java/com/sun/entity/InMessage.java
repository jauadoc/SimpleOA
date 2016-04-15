package com.sun.entity;

public class InMessage {
	int uid;
	String data;
	String date;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
		return "InMessage [uid=" + uid + ", data=" + data + ", date=" + date
				+ "]";
	}
	public InMessage(int uid, String data, String date) {
		super();
		this.uid = uid;
		this.data = data;
		this.date = date;
	}
	public InMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
