<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.OrderItem"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Order Management</title>
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"> -->
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
</head>
<%@ include file="adHeader.jsp"%>
	<style>
/* General Styles */
body {
	background-color: #f9f9f9;
	font-family: 'Arial', sans-serif;
}

.order-block {
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.order-header {
	font-size: 1.3rem;
	font-weight: bold;
	color: #343a40;
}

.order-items {
	margin-top: 10px;
}

.order-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
	border-bottom: 1px solid #f1f1f1;
}

.order-item img {
	width: 50px;
	height: 50px;
	border-radius: 5px;
}

.order-item-details {
	margin-left: 15px;
	flex: 1;
}

.order-item-price {
	font-weight: bold;
	color: #28a745;
}

.order-total {
	font-size: 1.1rem;
	font-weight: bold;
	color: #007bff;
}

.order-actions {
	display: flex;
	justify-content: flex-end;
	gap: 15px;
}

.order-status {
	font-size: 1rem;
	padding: 5px 10px;
	border-radius: 5px;
	font-weight: bold;
	color: #fff;
}

.badge-pending {
	background-color: #ffc107;
}

.badge-confirmed {
	background-color: #28a745;
}
.badge-Cancelled{
     background-color: #ff0000;
}

.btn-custom {
	padding: 8px 8px;
	font-size: 0.9rem;
	border-radius: 10px;
	text-transform: uppercase;
	transition: background-color 0.3s;
}

.btn-accept {
	background-color: #28a745;
	color: white;
}

.btn-accept:hover {
	background-color: #218838;
}

.btn-decline {
	background-color: #dc3545;
	color: white;
}

.btn-decline:hover {
	background-color: #c82333;
}

.order-container {
	margin-top: 30px;
}

/* Adjust card width */
.order-row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.order-card {
	flex: 1 1 30%; /* Adjusted for wider cards */
	max-width: 33%;
	margin-bottom: 20px;
}

@media ( max-width : 768px) {
	.order-card {
		flex: 1 1 100%; /* Stack cards on smaller screens */
		max-width: 100%;
	}
}

/* Amount Section Styling */
.amount-section {
	margin-top: 15px;
	border-top: 1px solid #f1f1f1;
	padding-top: 15px;
}

.amount-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.amount-row strong {
	font-size: 1rem;
}

.amount-row .value {
	font-size: 1.1rem;
	font-weight: bold;
	color: #007bff;
}

</style>
<body>
	
	<div class="container order-container">
		<h4 class="text-center mb-4">Admin Order Management</h4>
		<div class="row order-row">
			<%
			Methods s1 = new Methods(session);
			ArrayList<OrderItem> ar = s1.getOrderListAd();

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
			<div class="col-md-4 mb-4 order-card">
				<div class="order-block">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<div class="order-header">
								Order
								<%=orderId%></div>
							<div class="text-muted small">Placed on: 2024-12-20</div>
						</div>
						<div>
							<%
							if (status.equals("Pending")) {
							%>
							<span class="order-status badge-pending"><%=status%></span>
							<%
							} else if (status.equals("Confirmed")) {
							%>
							<span class="order-status badge-confirmed"><%=status%></span>
							<%
							} else if(status.equals("Cancelled")){
							%>
							<span class="order-status badge-Cancelled"><%=status%></span>
							<%} %>
						</div>

					</div>

					<!-- View Details Button -->
					<button class="btn btn-primary btn-custom mt-3"
						data-bs-toggle="collapse" href="#orderDetails<%=orderId%>"
						role="button" aria-expanded="false"
						aria-controls="orderDetails<%=orderId%>">View Details</button>

					<!-- Order Items (Initially Hidden) -->
					<div class="collapse" id="orderDetails<%=orderId%>">
						<div class="order-items">
							<%
							// Iterate through items in the current order
							for (OrderItem item : items) {
							%>
							<div class="order-item">
								<img src="<%=item.getProductImage()%>" alt="Product Image">
								<div class="order-item-details">
									<div>
										<strong><%=item.getProductName()%> | Q-<%=item.getQuantity()%></strong>
									</div>
									<small><%=item.getProductDescription()%></small>
								</div>
								<div class="order-item-price">
									$<%=item.getProductCost()%></div>
							</div>
							<%
							}
							%>

							<!-- Total Amount -->
							<div class="mt-3">
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<strong>Sub Total Amount:</strong>
									</div>
									<div class="order-total">
										$<%=String.format("%.2f", subtotal)%></div>
								</div>
								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div>
										<strong>Discount:</strong>
									</div>
									<div class="order-total">
										-$<%=String.format("%.2f", discount)%></div>
								</div>
								<div
									class="d-flex justify-content-between align-items-center mt-2">
									<div>
										<strong>Total Amount:</strong>
									</div>
									<div class="order-total">
										$<%=String.format("%.2f", payAmount)%></div>
								</div>
							</div>
							<!-- Action Buttons -->
							<form action="ManangeOrders" method="post">
								<div class="order-actions mt-3">
									<input type="hidden" name="orderId" value="<%=orderId%>">
									<button class="btn btn-decline btn-custom" name="cancel">Cancel</button>
									<button class="btn btn-accept btn-custom" name="accept">Accept</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
<%@ include file="Footer.jsp" %>
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

