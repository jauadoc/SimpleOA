package com.sun.entity.data;

public class Job {
	int id;
	String name;
	String description;
	int obey_department;
	int authorization;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getObey_department() {
		return obey_department;
	}
	public void setObey_department(int obey_department) {
		this.obey_department = obey_department;
	}
	public int getAuthorization() {
		return authorization;
	}
	public void setAuthorization(int authorization) {
		this.authorization = authorization;
	}
	@Override
	public String toString() {
		return "Job [id=" + id + ", name=" + name + ", description="
				+ description + ", obey_department=" + obey_department
				+ ", authorization=" + authorization + "]";
	}
	public Job(int id, String name, String description, int obey_department,
			int authorization) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.obey_department = obey_department;
		this.authorization = authorization;
	}
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
