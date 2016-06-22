package com.sun.entity.outData;

import java.util.Date;

public class FriendInfo {
	String name;
	Date birthday;
	String tel_phone;
	String mobile_phone;
	String email;
	String status;
	String head;
	String job;
	String department;
	String position_status;
	String gender;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTel_phone() {
		return tel_phone;
	}

	public void setTel_phone(String tel_phone) {
		this.tel_phone = tel_phone;
	}

	public String getMobile_phone() {
		return mobile_phone;
	}

	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition_status() {
		return position_status;
	}

	public void setPosition_status(String position_status) {
		this.position_status = position_status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", birthday=" + birthday + ", tel_phone=" + tel_phone + ", mobile_phone=" + mobile_phone + ", email=" + email + ", status=" + status + ", head=" + head + ", job=" + job + ", department=" + department + ", position_status=" + position_status + ", gender=" + gender + "]";
	}

	public FriendInfo(String name, Date birthday, String tel_phone, String mobile_phone, String email, String status, String head, String job, String department, String position_status, String gender) {
		super();
		this.name = name;
		this.birthday = birthday;
		this.tel_phone = tel_phone;
		this.mobile_phone = mobile_phone;
		this.email = email;
		this.status = status;
		this.head = head;
		this.job = job;
		this.department = department;
		this.position_status = position_status;
		this.gender = gender;
	}

	public FriendInfo() {
		
	}
}
