<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.Product"%>
<%@page import="com.ShopCart.Pojo.Order"%>
<%@page import="com.ShopCart.Pojo.OrderItem"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopCart</title>
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f9f9f9;
}

.order-header {
	font-size: 1.5rem;
	font-weight: bold;
}

.order-item img {
	width: 60px;
	height: 60px;
	object-fit: contain;
}

.activity-icon {
	font-size: 1.5rem;
	margin-right: 10px;
}

.activity-item {
	display: flex;
	align-items: center;
}

.order-status-container {
	display: flex;
	justify-content: space-between;
	color: black;
	border-radius: 5px;
}

.order-status-container strong {
	margin-right: 10px;
}

.badge-pending {
	color: #ffc107;
	font-weight: bold;
	}

.badge-confirmed {
	color: #28a745;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%if(session.getAttribute("uname")!=null) {%>
	<div class="container mt-4">
		<div class="row">
			<!-- Order Details -->
			<div class="col-lg-8">
				<%
				// Initialize a method to fetch order items
				Methods s1 = new Methods(session);
				ArrayList<OrderItem> ar = s1.getOrderInfo();

				// Group order items by order_id
				Map<Long, List<OrderItem>> ordersMap = new HashMap<>();
				for (OrderItem item : ar) {
					ordersMap.computeIfAbsent(item.getOrderId(), k -> new ArrayList<>()).add(item);
				}

				// Iterate through the grouped orders
				for (Map.Entry<Long, List<OrderItem>> entry : ordersMap.entrySet()) {
					Long orderId = entry.getKey();
					List<OrderItem> items = entry.getValue();

					// Calculate totals for each order
					double subtotal = 0;
					for (OrderItem item : items) {
						subtotal += item.getProductCost() * item.getQuantity(); // Cost per product
					}
					double discount = subtotal * 0.10; // Example: 10% discount
					double payAmount = subtotal - discount;

					// Assume the status is consistent for all items of an order
					String status = items.get(0).getStatus();
				%>
				<div class="card mb-4">
					<div class="card-body">
						<!-- Order Header -->
						<div class="d-flex justify-content-between align-items-center">
							<div class="order-header">
								Order Number:
								<%=orderId%></div>
							<div>
								<button class="btn btn-outline-secondary btn-sm">Message
									Customer</button>
								<button class="btn btn-primary btn-sm">Track Order</button>
							</div>
						</div>
						<hr>

						<!-- Items List -->
						<div class="order-items-list">
							<%
							// Iterate through items in the current order
							for (OrderItem item : items) {
							%>
							<div class="order-item d-flex mb-3">
								<img src="<%=item.getProductImage()%>" alt="Product Image"
									width="50">
								<div class="ml-3">
									<div><%=item.getProductName()%>
										| Q-<%=item.getQuantity()%></div>
									<small><%=item.getProductDescription()%></small>
								</div>
								<div class="ml-auto">
									$<%=String.format("%.2f", item.getProductCost())%></div>
							</div>
							<%
							}
							%>
						</div>
						<hr>

						<!-- Order Summary -->
						<div class="order-status-container">
							<div class="d-flex">
								<strong>Order Status:</strong>
								<%
								if (status.equals("Pending")) {
								%>
								<span class="order-status badge-pending"><%=status%></span>
								<%
								} else if (status.equals("Confirmed")) {
								%>
								<span class="order-status badge-confirmed"><%=status%></span>
								<%
								}
								%>
							</div>
							<div class="text-right">
								<div>
									Subtotal: <strong>$<%=String.format("%.2f", subtotal)%></strong>
								</div>
								<div>
									Discount: <strong style="color: green;">-$<%=String.format("%.2f", discount)%></strong>
								</div>
								<h5 class="mt-2 text-primary">
									Total: $<%=String.format("%.2f", payAmount)%></h5>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<!-- Activity Panel -->
			<div class="col-lg-4">
				<div class="card">
					<div class="card-body">
						<h5 class="mb-3">Activity</h5>
						<div class="activity-item mb-3">
							<span class="activity-icon text-success">&#x2713;</span>
							<div>
								<strong>Ready to Pickup</strong><br> <small>Order#252596
									from T-shirt | 11:00</small>
							</div>
						</div>
						<div class="activity-item mb-3">
							<span class="activity-icon text-warning">&#x1F4E6;</span>
							<div>
								<strong>Order Processed</strong><br> <small>Order#252596
									from T-shirt | 10:30</small>
							</div>
						</div>
						<div class="activity-item mb-3">
							<span class="activity-icon text-info">&#x1F4B3;</span>
							<div>
								<strong>Payment Confirmed</strong><br> <small>Order#252596
									from T-shirt | 10:00</small>
							</div>
						</div>
						<div class="activity-item mb-3">
							<span class="activity-icon text-secondary">&#x1F4DD;</span>
							<div>
								<strong>Order Placed</strong><br> <small>Order#252596
									from T-shirt | 09:30</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%} else { %>
	     <h3 class="text-center mt-5">Appologies.Please Go And login to view Orders Page.</h3>
	<%} %>
<%@ include file="Footer.jsp" %>
	<!-- Bootstrap JS and Dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
