package com.buyerschoice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Destination {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int destid;

	@Column
	private String destname;
	@Column
	private String destdesc;
	@Column
	private int packageid;
	@Column
	private String packagename;
	@Column
	private String suppliername;
	@Column
	private int stock;

	@Column
	private int price;

	public Destination() {
	}

	@Transient
	private MultipartFile pimage;

	public MultipartFile getPimage() {
		return pimage;
	}

	public void setPimage(MultipartFile pimage) {
		this.pimage = pimage;
	}
	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getDestid() {
		return destid;
	}

	public void setDestid(int destid) {
		this.destid = destid;
	}

	public String getDestname() {
		return destname;
	}

	public void setDestname(String destname) {
		this.destname = destname;
	}

	public String getDestdesc() {
		return destdesc;
	}

	public void setDestdesc(String destdesc) {
		this.destdesc = destdesc;
	}

	public int getPackageid() {
		return packageid;
	}

	public void setPackageid(int packageid) {
		this.packageid = packageid;
	}

	public String getPackagename() {
		return packagename;
	}

	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
