package com.buyerschoice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class AddCart {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cartID;
	
	@Column
	private int destid;
	
	@Column
	private int price;
	
	@Column
	private int stock;
	@Column
	private String destname;
	@Column
	private int total;
	@Column
	private int qty=1;
	@Column
	private int orderID;


	
public AddCart()
{}



public int getCartID() {
	return cartID;
}



public void setCartID(int cartID) {
	this.cartID = cartID;
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



public int getPrice() {
	return price;
}



public void setPrice(int price) {
	this.price = price;
}



public String getDestname() {
	return destname;
}



public void setDestname(String destname) {
	this.destname = destname;
}



public int getTotal() {
	return total;
}



public void setTotal(int total) {
	this.total = total;
}



public int getQty() {
	return qty;
}



public void setQty(int qty) {
	this.qty = qty;
}



public int getOrderID() {
	return orderID;
}



public void setOrderID(int orderID) {
	this.orderID = orderID;
}


}
