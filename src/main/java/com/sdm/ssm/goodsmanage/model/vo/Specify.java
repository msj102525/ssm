package com.sdm.ssm.goodsmanage.model.vo;

import java.sql.Date;

public class Specify implements java.io.Serializable{

	private static final long serialVersionUID = -24672002857221168L;
	
	private int id;
	private Date pdDate;
	private int pdPrice;
	
	public Specify() {
		super();
	}
	public Specify(int id, Date pdDate, int pdPrice) {
		super();
		this.id = id;
		this.pdDate = pdDate;
		this.pdPrice = pdPrice;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Specify [pdDate=" + pdDate + ", pdPrice=" + pdPrice + "]";
	}
	
	
}
