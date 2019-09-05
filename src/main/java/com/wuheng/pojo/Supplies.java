package com.wuheng.pojo;

import java.io.Serializable;

public class Supplies implements Serializable {

	private Integer sid;
	private String sname;
	private Integer snum;
	private Double sprice;
	private Integer sproduct;
	

	private Product product;
	
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Integer getSnum() {
		return snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	public Double getSprice() {
		return sprice;
	}

	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}


	public Integer getSproduct() {
		return sproduct;
	}

	public void setSproduct(Integer sproduct) {
		this.sproduct = sproduct;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Supplies [sid=" + sid + ", sname=" + sname + ", snum=" + snum + ", sprice=" + sprice + ", sproduct="
				+ sproduct + ", product=" + product + "]";
	}

}
