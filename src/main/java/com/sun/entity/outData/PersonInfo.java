package com.sun.entity.outData;

public class PersonInfo {
	String show;
	String key;
	String value;
	String modify;
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getModify() {
		return modify;
	}
	public void setModify(String modify) {
		this.modify = modify;
	}
	public PersonInfo(String show, String key, String value, String modify) {
		super();
		this.show = show;
		this.key = key;
		this.value = value;
		this.modify = modify;
	}
	public PersonInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PersonInfo [show=" + show + ", key=" + key + ", value=" + value + ", modify=" + modify + "]";
	}
	
}
