package com.sun.entity.data;

import java.util.Date;

public class Announcement {
	int id;
	String name;
	String content;
	int kind;
	int did;
	Date announcement_date;
	int is_show;
	Date expiration;
	String href;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public Date getAnnouncement_date() {
		return announcement_date;
	}
	public void setAnnouncement_date(Date announcement_date) {
		this.announcement_date = announcement_date;
	}
	public int getIs_show() {
		return is_show;
	}
	public void setIs_show(int is_show) {
		this.is_show = is_show;
	}
	public Date getExpiration() {
		return expiration;
	}
	public void setExpiration(Date expiration) {
		this.expiration = expiration;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	@Override
	public String toString() {
		return "Announcement [id=" + id + ", name=" + name + ", content="
				+ content + ", kind=" + kind + ", did=" + did
				+ ", announcement_date=" + announcement_date + ", is_show="
				+ is_show + ", expiration=" + expiration + ", href=" + href
				+ "]";
	}
	public Announcement(int id, String name, String content, int kind, int did,
			Date announcement_date, int is_show, Date expiration, String href) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
		this.kind = kind;
		this.did = did;
		this.announcement_date = announcement_date;
		this.is_show = is_show;
		this.expiration = expiration;
		this.href = href;
	}
	public Announcement() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
