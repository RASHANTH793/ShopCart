package com.ShopCart.Methods;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ShopCart.Pojo.Cart;
import com.ShopCart.Pojo.Order;
import com.ShopCart.Pojo.OrderItem;
import com.ShopCart.Pojo.Product;
import com.ShopCart.Pojo.UserDetails;

import jakarta.servlet.http.HttpSession;

public class Methods {
	private Connection con;
	HttpSession se;

	public Methods(HttpSession session) {

		try {
			//Port:4000
			//Host:gateway01.ap-southeast-1.prod.aws.tidbcloud.com
			//UserName:2mMmQxjSTcE9em6.root
			//Password:TbJrE2g0VA2kflzA
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/test", "2mMmQxjSTcE9em6.root", "TbJrE2g0VA2kflzA");
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String Registration(String name, String email, String pw) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from users where  email='" + email + "';");
			boolean b = rs.next();
			if (b) {
				status = "existed";
			} else {
				ps = (PreparedStatement) con.prepareStatement("insert into users values(0,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, pw);
				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String email, String pass) {
		String status1 = "", id = "";
		String name = "", emails = "";
		String eid = "jprashanth429@gmail.com", pwd = "123456", em = "", nm = "";
		if (email.equals(eid) && pass.equals(pwd)) {

			id = "1";
			nm = "Prashanth";
			em = "jprashanth429@gmail.com";
			se.setAttribute("uname", nm);
			se.setAttribute("email", em);
			se.setAttribute("id", id);
			status1 = "adm success";
		} else {

			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();

				rs = st.executeQuery("select * from users where email='" + email + "' and password='" + pass + "';");
				boolean b = rs.next();
				if (b == true) {
					id = rs.getString("user_id");
					name = rs.getString("name");
					emails = rs.getString("email");
					se.setAttribute("uname", name);
					se.setAttribute("email", emails);
					se.setAttribute("id", id);
					status1 = "success";
				} else {
					status1 = "failure";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status1;
	}

	public ArrayList<Product> getEventList() {
		ArrayList<Product> al = new ArrayList<Product>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from Products;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Product d = new Product(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setproduct_id(rs.getInt("product_id"));
				d.setproduct_name(rs.getString("product_name"));
				d.setproduct_details(rs.getString("description"));
				d.setproduct_cost(rs.getDouble("price"));
				d.setproduct_img(rs.getString("image_url"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String addProduct(String name, String desc, String cost, String image) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from products where product_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				ps = con.prepareStatement("insert into products values (0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, desc);
				ps.setString(3, cost);
				ps.setString(4, image);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String deleteproduct(String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from products where product_name='" + category + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String addtocart(String pid, String Quid) {
		int pdi = Integer.parseInt(pid);
		int qid = Integer.parseInt(Quid);
		String status = "";
		try {
			Statement st = null;
			st = (Statement) con.createStatement();
			String qry = "insert into cart select 0,image_url,product_name,price,description," + qid + ","
					+ se.getAttribute("id") + ",'" + se.getAttribute("uname")
					+ "','pending',now() from products where product_id=" + pdi + ";";
			int a = st.executeUpdate(qry);
			status = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

//	public String addtoOrder(String payment) {
//	    String status = "";
//	    try {
//	        Statement st = con.createStatement();
//	        String insertQuery = "INSERT INTO orders (product_image, product_id, product_name, product_description, product_cost, user_id, user_name, status, payment_mode, total_amount) "
//	                           + "SELECT product_image, product_id, product_name, description, product_cost, "
//	                           + se.getAttribute("id") + ", '" + se.getAttribute("uname") + "', 'pending', '" + payment + "', product_cost "
//	                           + "FROM cart WHERE user_id = " + se.getAttribute("id") + " AND status = 'pending';";
//	        int rowsInserted = st.executeUpdate(insertQuery);
//	        if (rowsInserted > 0) {
//	            status = "success";
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    return status;
//	}

	public ArrayList<Cart> getcartinfo() {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Cart> al = new ArrayList<Cart>();
		try {
			st = con.createStatement();
			String qry = ("select *  from cart where user_id=" + se.getAttribute("id") + " and status='pending';");
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Cart p = new Cart();
				p.setc_id(rs.getString("product_id"));
				p.setc_image(rs.getString("product_image"));
				p.setc_name(rs.getString("product_name"));
				p.setc_cost(rs.getDouble("product_cost"));
				p.setC_description(rs.getString("description"));
				p.setQuantity(rs.getString("Quantity"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public int deletecart(String c_id, String Cutd) {
		int ctd = Integer.parseInt(c_id);
		int Cut = Integer.parseInt(Cutd);
		int status = 0;
		try {
			Statement st = null;
			st = (Statement) con.createStatement();
			String qry = "UPDATE cart SET status='deleted' WHERE product_id='" + ctd + "' AND user_id='" + Cut + "';";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public Long createOrder(String userId, String payMode) {
		String userName = (String) se.getAttribute("uname");
		Double totalAmount = (Double) se.getAttribute("PayAmount");
		long orderId = (long) (Math.random() * 900000 + 100000);
		
		if (userName == null || totalAmount == null || userId == null) {
	        return null;
	    }

		try {
			String insertQuery = "INSERT INTO Orders (Order_ID, User_ID, User_Name, Order_Date, Payment_Mode, Total_Amount) VALUES (?, ?, ?, NOW(), ?, ?)";
			PreparedStatement pst = con.prepareStatement(insertQuery);
			pst.setLong(1, orderId);
			pst.setString(2, userId);
			pst.setString(3, userName);
			pst.setString(4, payMode);
			pst.setDouble(5, totalAmount);
			int a = pst.executeUpdate();

			if (a > 0) {
				return orderId;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * public boolean saveOrderItems(Long orderId, String userId) { String
	 * insertQuery =
	 * "INSERT INTO order_items (Order_ID, Product_ID, Product_Name, Product_Description, Product_Image, Product_Cost, Quantity) "
	 * +
	 * "SELECT ?, product_id, product_name, description, product_image, product_cost, Quantity "
	 * + "FROM cart WHERE user_id = ? AND status = 'pending'"; try
	 * (PreparedStatement pst = con.prepareStatement(insertQuery)) { pst.setLong(1,
	 * orderId); pst.setString(2, userId); int rowsInserted = pst.executeUpdate();
	 * if (rowsInserted > 0) { return true; } } catch (Exception e) {
	 * e.printStackTrace(); } return false; }
	 */
	public boolean saveOrderItems(Long orderId, String userId) {
	    String insertQuery = "INSERT INTO order_items (Order_ID,Product_ID, Product_Name, Product_Description, Product_Image, Product_Cost, Quantity) "
	            + "SELECT ?, product_id, product_name, description, product_image, product_cost, Quantity "
	            + "FROM cart WHERE user_id = ? AND status = 'pending'";
	    
	    String updateQuery = "UPDATE cart SET status='deleted' WHERE user_id = ? AND status = 'pending'";

	    try (PreparedStatement pstInsert = con.prepareStatement(insertQuery);
	         PreparedStatement pstUpdate = con.prepareStatement(updateQuery)) {

	        // Insert the items into the order_items table
	        pstInsert.setLong(1, orderId);
	        pstInsert.setString(2, userId);
	        int rowsInserted = pstInsert.executeUpdate();

	        // If rows are inserted, update the cart table
	        if (rowsInserted > 0) {
	            pstUpdate.setString(1, userId);
	            int rowsUpdated = pstUpdate.executeUpdate();
	            if(rowsUpdated > 0) {
	            	return true;// Return true if cart table is updated
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}


	public boolean saveOrderDetails(Long orderId, String address,String city, String state,String number, String zipcode) {
		String insertQuery = "INSERT INTO order_details (Order_ID, Delivery_Address, City, State, Postal_Code, Phone_Number) Values(?,?,?,?,?,?);";
				
		try (PreparedStatement pst = con.prepareStatement(insertQuery)) {
			pst.setLong(1, orderId);
			pst.setString(2, address);
			pst.setString(3, city);
			pst.setString(4, state);
			pst.setString(5, number);
			pst.setString(6, zipcode);
			int rowsInserted = pst.executeUpdate();
			if (rowsInserted > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<OrderItem> getOrderInfo() {
	    ArrayList<OrderItem> orderList = new ArrayList<>();
	    String user_id = (String) se.getAttribute("id");
	    try {
	        // Use LEFT JOIN instead of FULL JOIN
	        String query = "SELECT * FROM order_items o1 LEFT JOIN Orders o2 on o1.order_id = o2.order_id WHERE o2.user_id = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, user_id);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            OrderItem orderItem = new OrderItem();
	            orderItem.setOrderId(rs.getLong("order_id"));
	            orderItem.setProductImage(rs.getString("product_Image"));
	            orderItem.setProductName(rs.getString("product_Name"));
	            orderItem.setProductDescription(rs.getString("product_Description"));
	            orderItem.setProductCost(rs.getDouble("product_Cost"));
	            orderItem.setQuantity(rs.getInt("quantity"));
	            orderItem.setStatus(rs.getString("Status")); 
	            orderList.add(orderItem);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orderList;
	}
	public ArrayList<OrderItem> getOrderListAd() {
		ArrayList<OrderItem> al = new ArrayList<OrderItem>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from order_items;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				OrderItem d = new OrderItem(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setOrderId(rs.getLong("order_id"));
	            d.setProductImage(rs.getString("product_Image"));
	            d.setProductName(rs.getString("product_Name"));
	            d.setProductDescription(rs.getString("product_Description"));
	            d.setProductCost(rs.getDouble("product_Cost"));
	            d.setQuantity(rs.getInt("quantity"));
	            d.setStatus(rs.getString("Status")); 
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	

	
	public int AcceptOrder(int oid) {
	    int status = 0;
	    String updateOrdersQuery = "UPDATE orders SET status = 'Confirmed' WHERE order_id = ? AND status = 'Pending'";
	    String updateOtherTableQuery = "UPDATE order_items SET status = 'Confirmed' WHERE order_id = ? AND status = 'Pending'";
	    
	    try {
	        // Begin transaction
	        con.setAutoCommit(false);
	        
	        // Update the first table (orders)
	        try (PreparedStatement pst1 = con.prepareStatement(updateOrdersQuery)) {
	            pst1.setInt(1, oid);
	            status += pst1.executeUpdate(); // Add result to status
	        }
	        
	        // Update the second table (order_item)
	        try (PreparedStatement pst2 = con.prepareStatement(updateOtherTableQuery)) {
	            pst2.setInt(1, oid);
	            status += pst2.executeUpdate(); // Add result to status
	        }
	        
	        // Commit transaction if both updates succeed
	        con.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            // Rollback transaction in case of an error
	            con.rollback();
	        } catch (Exception rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	        status = 0; // Reset status to indicate failure
	    } finally {
	        try {
	            // Restore default auto-commit behavior
	            con.setAutoCommit(true);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return status;
	}
	public int cancelOrder(int oid) {
	    int status = 0;
	    String updateOrdersQuery = "UPDATE orders SET status = 'Cancelled' WHERE order_id = ? AND status = 'Pending'";
	    String updateOtherTableQuery = "UPDATE order_items SET status = 'Cancelled' WHERE order_id = ? AND status = 'Pending'";

	    try {
	        // Begin transaction
	        con.setAutoCommit(false);

	        // Update the first table (orders)
	        try (PreparedStatement pst1 = con.prepareStatement(updateOrdersQuery)) {
	            pst1.setInt(1, oid);
	            status += pst1.executeUpdate(); // Add result to status
	        }

	        // Update the second table (order_items)
	        try (PreparedStatement pst2 = con.prepareStatement(updateOtherTableQuery)) {
	            pst2.setInt(1, oid);
	            status += pst2.executeUpdate(); // Add result to status
	        }

	        // Commit transaction if both updates succeed
	        con.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            // Rollback transaction in case of an error
	            con.rollback();
	        } catch (Exception rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	        status = 0; // Reset status to indicate failure
	    } finally {
	        try {
	            // Restore default auto-commit behavior
	            con.setAutoCommit(true);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return status;
	}
	
	public UserDetails getInfo() {
        Statement st = null;
        ResultSet rs = null;
        UserDetails s = null;
        String useId = (String) se.getAttribute("id");
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from User_Details where user_id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new UserDetails();
                s.setUser_id(useId);
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setCity(rs.getString("city"));
                s.setAddress(rs.getString("Address"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

	/*
	 * public String UpdateProflie(String name, String email, String phone,String
	 * city, String address) { String status = null; int user_id = (int)
	 * se.getAttribute("id"); Statement st = null; ResultSet rs = null; try { st =
	 * con.createStatement();
	 * st.executeUpdate("update User_details set user_id='"+user_id+"', name='" +
	 * name + "',phone_number='" + phone + "',city='" + city +
	 * "',address='"+address+"', where slno= '" + se.getAttribute("id") + "' ");
	 * se.setAttribute("uname", name); status = "success"; } catch (Exception e) {
	 * status = "failure"; e.printStackTrace(); }
	 * 
	 * 
	 * return status; }
	 */
	public String updateProfile(String name, String email, String phone, String city, String address) {
	    String status = null;
	    int userId = (int) se.getAttribute("id"); // Assume 'id' is the user's ID
	    Statement st = null;

	    try {
	        st = con.createStatement();

	        // Update the User_details table
	        String updateUserDetailsQuery = "UPDATE User_details " +
	                "SET name = '" + name + "', phone_number = '" + phone + "', city = '" + city + "', address = '" + address + "' " +
	                "WHERE user_id = '" + userId + "'";
	        st.executeUpdate(updateUserDetailsQuery);

	        // Update the Users table if there are changes in name or email
	        String updateUsersQuery = "UPDATE Users " +
	                "SET name = '" + name + "', email = '" + email + "' " +
	                "WHERE user_id = '" + userId + "'";
	        st.executeUpdate(updateUsersQuery);

	        // Update the session attribute if the name has changed
	        se.setAttribute("uname", name);

	        status = "success";
	    } catch (Exception e) {
	        status = "failure";
	        e.printStackTrace();
	    }

	    return status;
	}





}
