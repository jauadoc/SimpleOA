package com.sun.entity.data;

public class Function {
	int id;
	String name;
	String href;
	int obey;
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
	public Function(int id, String name, String href, int obey) {
		super();
		this.id = id;
		this.name = name;
		this.href = href;
		this.obey = obey;
	}
	public Function() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Function [id=" + id + ", name=" + name + ", href=" + href
				+ ", obey=" + obey + "]";
	}
	
	
}
