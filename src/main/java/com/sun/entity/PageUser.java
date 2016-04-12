package com.sun.entity;

public class PageUser {
	int id;
	String uname;
	String name;
	String head;
	String pwd;
	int jid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}

	@Override
	public String toString() {
		return "PageUser [id=" + id + ", uname=" + uname + ", name=" + name
				+ ", head=" + head + ", pwd=" + pwd + ", jid=" + jid + "]";
	}

	public PageUser(int id, String uname, String name, String head, String pwd,
			int jid) {
		super();
		this.id = id;
		this.uname = uname;
		this.name = name;
		this.head = head;
		this.pwd = pwd;
		this.jid = jid;
	}
	public PageUser() {
		super();
		// TODO Auto-generated constructor stub
	}

}
