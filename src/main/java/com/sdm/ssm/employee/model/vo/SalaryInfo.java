package com.sdm.ssm.employee.model.vo;

public class SalaryInfo implements java.io.Serializable {

	private static final long serialVersionUID = -1745629583174487794L;

	private int empId;
	private String bankName;
	private String bankAccountNo;	
	private String accountHolder;
	private String premium;
	private String tax;
		
	private int id;
	
	public SalaryInfo() {
		super();
	}

	public SalaryInfo(int empId, String bankName, String bankAccountNo, String accountHolder, String premium,
			String tax, int id) {
		super();
		this.empId = empId;
		this.bankName = bankName;
		this.bankAccountNo = bankAccountNo;
		this.accountHolder = accountHolder;
		this.premium = premium;
		this.tax = tax;
		this.id = id;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccountNo() {
		return bankAccountNo;
	}

	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getPremium() {
		return premium;
	}

	public void setPremium(String premium) {
		this.premium = premium;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SalaryInfo [empId=" + empId + ", bankName=" + bankName + ", bankAccountNo=" + bankAccountNo
				+ ", accountHolder=" + accountHolder + ", premium=" + premium + ", tax=" + tax + ", id=" + id + "]";
	}

	

}
