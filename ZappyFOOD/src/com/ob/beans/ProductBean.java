package com.ob.beans;

public class ProductBean {
	
   String product_Id;
   String product_name;
   double product_price;
   String product_weigth;
   String product_details;
   String product_image;
   double total;
   int quantity;
   int orderNo;
   String UID;
   int increment_id;
   double grand_total;
   
  public double getGrand_total() {
	return grand_total;
}
public void setGrand_total(double grand_total) {
	this.grand_total = grand_total;
}
public int getIncrement_id() {
	return increment_id;
}
public void setIncrement_id(int increment_id) {
	this.increment_id = increment_id;
}
public String getUID() {
	return UID;
}
public void setUID(String uID) {
	UID = uID;
}
public int getOrderNo() {
	return orderNo;
}
public void setOrderNo(int orderNo) {
	this.orderNo = orderNo;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
int status; 
  
   public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public double getTotal() {
	return total;
}
public String getProduct_Id() {
	return product_Id;
}
public void setProduct_Id(String product_Id) {
	this.product_Id = product_Id;
}
public void setTotal(double total) {
	this.total = total;
}

public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public double getProduct_price() {
	return product_price;
}
public void setProduct_price(double product_price) {
	this.product_price = product_price;
}
public String getProduct_weigth() {
	return product_weigth;
}
public void setProduct_weigth(String product_weigth) {
	this.product_weigth = product_weigth;
}
public String getProduct_details() {
	return product_details;
}
public void setProduct_details(String product_details) {
	this.product_details = product_details;
}
public String getProduct_image() {
	return product_image;
}
public void setProduct_image(String product_image) {
	this.product_image = product_image;
}
   
	

}
