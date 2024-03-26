package com.sdm.ssm.goodsmanage.model.vo;

public class Produce {

	private int pdNo;
	private int goodsNo;
	private String pdName;
	private String producer;
	private String pdPhone;
	private String pdAdress;
	
	public Produce() {
		super();
	}
	
	public Produce(int pdNo, int goodsNo) {
		super();
		this.pdNo = pdNo;
		this.goodsNo = goodsNo;
	}
	
	public Produce(int pdNo, int goodsNo, String pdName, String producer, String pdPhone, String pdAdress) {
		super();
		this.pdNo = pdNo;
		this.goodsNo = goodsNo;
		this.pdName = pdName;
		this.producer = producer;
		this.pdPhone = pdPhone;
		this.pdAdress = pdAdress;
	}
	
	
	
	
}
