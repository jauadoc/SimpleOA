package com.sun.entity.data;

import java.util.Date;

public class Mission {
	int id;
	String name;
	String description;
	int executor;
	int publisher;
	Date start_date;
	Date end_date;
	int is_end;
	int is_overdate;
	int is_delay;
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
	public int getExecutor() {
		return executor;
	}
	public void setExecutor(int executor) {
		this.executor = executor;
	}
	public int getPublisher() {
		return publisher;
	}
	public void setPublisher(int publisher) {
		this.publisher = publisher;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date satrt_date) {
		this.start_date = satrt_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getIs_end() {
		return is_end;
	}
	public void setIs_end(int is_end) {
		this.is_end = is_end;
	}
	public int getIs_overdate() {
		return is_overdate;
	}
	public void setIs_overdate(int is_overdate) {
		this.is_overdate = is_overdate;
	}
	public int getIs_delay() {
		return is_delay;
	}
	public void setIs_delay(int is_delay) {
		this.is_delay = is_delay;
	}
	@Override
	public String toString() {
		return "Mission [id=" + id + ", name=" + name + ", description="
				+ description + ", executor=" + executor + ", publisher="
				+ publisher + ", satrt_date=" + start_date + ", end_date="
				+ end_date + ", is_end=" + is_end + ", is_overdate="
				+ is_overdate + ", is_delay=" + is_delay + "]";
	}
	public Mission(int id, String name, String description, int executor,
			int publisher, Date satrt_date, Date end_date, int is_end,
			int is_overdate, int is_delay) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.executor = executor;
		this.publisher = publisher;
		this.start_date = satrt_date;
		this.end_date = end_date;
		this.is_end = is_end;
		this.is_overdate = is_overdate;
		this.is_delay = is_delay;
	}
	public Mission() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
