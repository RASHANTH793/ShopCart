package com.ShopCart.Pojo;

public class Cart {
	private String c_id;
	private String c_name;
	private String c_image;
	private double c_cost;
	private String c_description;
	private String Quantity;

	// Constructor
	public Cart(String c_id, String c_name, String c_image, double c_cost, String Quantity) {
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_image = c_image;
		this.c_cost = c_cost;
		this.c_description = c_description;
		this.Quantity = Quantity;

	}

	public Cart() {

	}

	// Getters and Setters
	public String getc_id() {
		return c_id;
	}

	public void setc_id(String c_id) {
		this.c_id = c_id;
	}

	public String getc_name() {
		return c_name;
	}

	public void setc_name(String c_name) {
		this.c_name = c_name;
	}

	public String getc_image() {
		return c_image;
	}

	public void setc_image(String c_image) {
		this.c_image = c_image;
	}

	public double getc_cost() {
		return c_cost;
	}

	public void setc_cost(double c_cost) {
		this.c_cost = c_cost;
	}

	public String getC_description() {
		return c_description;
	}

	public void setC_description(String c_description) {
		this.c_description = c_description;
	}

	public String getQuantity() {
		return Quantity;
	}

	public void setQuantity(String Quantity) {
		this.Quantity = Quantity;
	}

	
	
	
//	public int getTotalCost() {
//		return Integer.parseInt(c_cost) * Integer.parseInt(Quantity);
//	}

}
