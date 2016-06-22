package com.sun.entity.outData;

import java.util.Date;

public class Friend {
	int uid;
	String name;
	String head;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
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

	public Friend(int uid, String name, String head) {
		super();
		this.uid = uid;
		this.name = name;
		this.head = head;
	}

	@Override
	public String toString() {
		return "Friend [uid=" + uid + ", name=" + name + ", head=" + head + "]";
	}

	public Friend() {
		
	}
}
