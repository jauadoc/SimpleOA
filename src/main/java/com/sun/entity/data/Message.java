package com.sun.entity.data;

import java.util.Date;

public class Message {
	int id;
	String title;
	String content;
	int sender;
	Date date;
	int is_read;
	String sender_name;
	int uid;
	int kind;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getIs_read() {
		return is_read;
	}
	public void setIs_read(int is_read) {
		this.is_read = is_read;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", title=" + title + ", content=" + content + ", sender=" + sender + ", date=" + date + ", is_read=" + is_read + ", sender_name=" + sender_name + ", uid=" + uid + ", kind=" + kind + "]";
	}
	public Message(int id, String title, String content, int sender, Date date, int is_read, String sender_name, int uid, int kind) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.sender = sender;
		this.date = date;
		this.is_read = is_read;
		this.sender_name = sender_name;
		this.uid = uid;
		this.kind = kind;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
