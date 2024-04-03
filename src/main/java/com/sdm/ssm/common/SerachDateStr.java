package com.sdm.ssm.common;

public class SerachDateStr {
	private String sdate;
	private String edate;
	
	public SerachDateStr() {
		super();
	}

	public SerachDateStr(String sdate, String edate) {
		super();
		this.sdate = sdate;
		this.edate = edate;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	@Override
	public String toString() {
		return "SerachDateStr [sdate=" + sdate + ", edate=" + edate + "]";
	}


}
