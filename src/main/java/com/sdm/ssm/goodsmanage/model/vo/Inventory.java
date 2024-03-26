package com.sdm.ssm.goodsmanage.model.vo;

public class Inventory {

	private int goodsNo;
	private int pdQuantity;
	private int minAlarmQuantity;
	private int minProduceQuantity;
	
	public Inventory() {
		super();
	}

	public Inventory(int goodsNo, int pdQuantity) {
		super();
		this.goodsNo = goodsNo;
		this.pdQuantity = pdQuantity;
	}
	
	
	public Inventory(int goodsNo, int pdQuantity, int minAlarmQuantity, int minProduceQuantity) {
		super();
		this.goodsNo = goodsNo;
		this.pdQuantity = pdQuantity;
		this.minAlarmQuantity = minAlarmQuantity;
		this.minProduceQuantity = minProduceQuantity;
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

	public int getMinProduceQuantity() {
		return minProduceQuantity;
	}

	public void setMinProduceQuantity(int minProduceQuantity) {
		this.minProduceQuantity = minProduceQuantity;
	}

	@Override
	public String toString() {
		return "Inventory [goodsNo=" + goodsNo + ", pdQuantity=" + pdQuantity + ", minAlarmQuantity=" + minAlarmQuantity
				+ ", minProduceQuantity=" + minProduceQuantity + "]";
	}
	
	
	
}
