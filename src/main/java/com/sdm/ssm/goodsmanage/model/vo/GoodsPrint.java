package com.sdm.ssm.goodsmanage.model.vo;

public class GoodsPrint implements java.io.Serializable{

	private int ID;
	private int goodsNo;
	private String goodsName;
	
	private int pdQuantity;
	
	private String goodsUnit;
	
	private int minAlarmQuantity;
	private int minOrderQuantity;
	
	private int pdNo;
	private String pdName;
	private String pdPhone;
	
	private int goodsPrice;
	private String nation;
	
	public GoodsPrint() {
		super();
	}

	public GoodsPrint(int goodsNo, String goodsName, int pdQuantity, String goodsUnit, int minAlarmQuantity,
			int minOrderQuantity, String pdName, String pdPhone, int goodsPrice, String nation) {
		super();
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
		this.pdQuantity = pdQuantity;
		this.goodsUnit = goodsUnit;
		this.minAlarmQuantity = minAlarmQuantity;
		this.minOrderQuantity = minOrderQuantity;
		this.pdName = pdName;
		this.pdPhone = pdPhone;
		this.goodsPrice = goodsPrice;
		this.nation = nation;
	}

	public GoodsPrint(int ID, int goodsNo, String goodsName, int pdQuantity, String goodsUnit, int minAlarmQuantity,
			int minOrderQuantity, int pdNo, String pdName, String pdPhone, int goodsPrice, String nation) {
		super();
		this.ID = ID;
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
		this.pdQuantity = pdQuantity;
		this.goodsUnit = goodsUnit;
		this.minAlarmQuantity = minAlarmQuantity;
		this.minOrderQuantity = minOrderQuantity;
		this.pdNo = pdNo;
		this.pdName = pdName;
		this.pdPhone = pdPhone;
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

	public int getPdQuantity() {
		return pdQuantity;
	}

	public void setPdQuantity(int pdQuantity) {
		this.pdQuantity = pdQuantity;
	}

	public String getGoodsUnit() {
		return goodsUnit;
	}

	public void setGoodsUnit(String goodsUnit) {
		this.goodsUnit = goodsUnit;
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

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public String getPdPhone() {
		return pdPhone;
	}

	public void setPdPhone(String pdPhone) {
		this.pdPhone = pdPhone;
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
		return "GoodsPrint [ID=" + ID + ", goodsNo=" + goodsNo + ", goodsName=" + goodsName + ", pdQuantity="
				+ pdQuantity + ", goodsUnit=" + goodsUnit + ", minAlarmQuantity=" + minAlarmQuantity
				+ ", minOrderQuantity=" + minOrderQuantity + ", pdNo=" + pdNo + ", pdName=" + pdName + ", pdPhone="
				+ pdPhone + ", goodsPrice=" + goodsPrice + ", nation=" + nation + "]";
	}

}