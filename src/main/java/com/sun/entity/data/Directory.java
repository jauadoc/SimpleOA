package com.sun.entity.data;

public class Directory {
	int id;
	String name;
	String href;
	String img;
	int order;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "Directory [id=" + id + ", name=" + name + ", href=" + href
				+ ", img=" + img + ", order=" + order + "]";
	}
	public Directory(int id, String name, String href, String img, int order) {
		super();
		this.id = id;
		this.name = name;
		this.href = href;
		this.img = img;
		this.order = order;
	}
	public Directory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
