package com.sdm.ssm.goodsmanage.model.vo;

public class Inventory {

	private int goodsNo;
	private int pdQuantity;
	private int minAlarmQuantity;
	private int minOrderQuantity;
	
	public Inventory() {
		super();
	}

	public Inventory(int goodsNo, int pdQuantity) {
		super();
		this.goodsNo = goodsNo;
		this.pdQuantity = pdQuantity;
	}
	
	
	public Inventory(int goodsNo, int pdQuantity, int minAlarmQuantity, int minOrderQuantity) {
		super();
		this.goodsNo = goodsNo;
		this.pdQuantity = pdQuantity;
		this.minAlarmQuantity = minAlarmQuantity;
		this.minOrderQuantity = minOrderQuantity;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getPdQuantity() {
		return pdQuantity;
	}

	public void setPdQuantity(int pdQuantity) {
		this.pdQuantity = pdQuantity;
	}

	public int getMinAlarmQuantity() {
		return minAlarmQuantity;
	}

	public void setMinAlarmQuantity(int minAlarmQuantity) {
		this.minAlarmQuantity = minAlarmQuantity;
	}

	public int getMinOrderQuantity() {
		return minOrderQuantity;
	}

	public void setMinOrderQuantity(int minOrderQuantity) {
		this.minOrderQuantity = minOrderQuantity;
	}

	@Override
	public String toString() {
		return "Inventory [goodsNo=" + goodsNo + ", pdQuantity=" + pdQuantity + ", minAlarmQuantity=" + minAlarmQuantity
				+ ", minOrderQuantity=" + minOrderQuantity + "]";
	}
	
	
	
}
