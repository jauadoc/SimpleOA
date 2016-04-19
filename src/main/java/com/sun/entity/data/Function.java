package com.sun.entity.data;

public class Function {
	int id;
	String name;
	String href;
	int obey;
	String icon;
	int did;
	int power;
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
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public int getObey() {
		return obey;
	}
	public void setObey(int obey) {
		this.obey = obey;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	@Override
	public String toString() {
		return "Function [id=" + id + ", name=" + name + ", href=" + href
				+ ", obey=" + obey + ", icon=" + icon + ", did=" + did
				+ ", power=" + power + "]";
	}
	public Function(int id, String name, String href, int obey, String icon,
			int did, int power) {
		super();
		this.id = id;
		this.name = name;
		this.href = href;
		this.obey = obey;
		this.icon = icon;
		this.did = did;
		this.power = power;
	}
	public Function() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
