package com.dino.dto;

public class ProductVO {
	private Integer code;
	private String imgUrl;
	private String name;
	private String intro;
	private String saleLogo;
	private Integer originalPrice;
	private String discountRate;
	private Integer realPrice;
	

	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getimgUrl() {
		return imgUrl;
	}
	public void setimgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getintro() {
		return intro;
	}
	public void setintro(String intro) {
		this.intro = intro;
	}
	public String getsaleLogo() {
		return saleLogo;
	}
	public void setsaleLogo(String saleLogo) {
		this.saleLogo = saleLogo;
	}
	public Integer getoriginalPrice() {
		return originalPrice;
	}
	public void setoriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
	}
	public String getdiscountRate() {
		return discountRate;
	}
	public void setdiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	
	public Integer getrealPrice() {
		return realPrice;
	}
	public void setrealPrice(Integer realPrice) {
		this.realPrice = realPrice;
	}
	
	@Override
	public String toString() {
		return "ProductVO [code=" + code + ", imgUrl=" + imgUrl + ", name=" + name + ", intro=" + intro + ", saleLogo="
				+ saleLogo + ", originalPrice=" + originalPrice + ", discountRate=" + discountRate + ", realPrice="
				+ realPrice + "]";
	}
	
	
}
