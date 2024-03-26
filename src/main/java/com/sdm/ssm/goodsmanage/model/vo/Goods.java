package com.sdm.ssm.goodsmanage.model.vo;

public class Goods {

	private int ID;
	private int goodsNo;
	private String goodsName;
	private String goodsUnit;
	private int goodsPrice;
	private String nation;
	
	public Goods() {
		super();
	}

	public Goods(int ID, int goodsNo, String goodsName) {
		super();
		this.ID = ID;
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
	}
	
	public Goods(int ID, int goodsNo, String goodsName, String goodsUnit, int goodsPrice, String nation) {
		super();
		this.ID = ID;
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
		this.goodsUnit = goodsUnit;
		this.goodsPrice = goodsPrice;
		this.nation = nation;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsUnit() {
		return goodsUnit;
	}

	public void setGoodsUnit(String goodsUnit) {
		this.goodsUnit = goodsUnit;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Override
	public String toString() {
		return "Goods [ID=" + ID + ", goodsNo=" + goodsNo + ", goodsName=" + goodsName + ", goodsUnit=" + goodsUnit
				+ ", goodsPrice=" + goodsPrice + ", nation=" + nation + "]";
	}
	
	
	
	
}
