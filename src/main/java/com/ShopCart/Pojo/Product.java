package com.ShopCart.Pojo;

import java.sql.Date;

public class Product {
	public int product_id;
	public String product_name;
	public double product_cost;
	public String product_details;
	public String product_img;
	public Date date;

	public int getproduct_id() {
		return product_id;
	}

	public void setproduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getproduct_img() {
		return product_img;
	}

	public void setproduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getproduct_name() {
		return product_name;
	}

	public void setproduct_name(String product_name) {
		this.product_name = product_name;
	}

	public double getproduct_cost() {
		return product_cost;
	}

	public void setproduct_cost(double product_cost) {
		this.product_cost = product_cost;
	}

	public String getproduct_details() {
		return product_details;
	}

	public void setproduct_details(String product_details) {
		this.product_details = product_details;
	}

	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
