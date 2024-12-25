<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.Product"%>
<%@page import="com.ShopCart.Pojo.Cart"%>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
body {
	background-color: #f8f9fa;
}

#ConCar {
	font-family: Arial, sans-serif;
	font-weight: lighter;
}

#Con {
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

#CartCon {
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.cart-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.product-img {
	width: 220px;
	height: 150px;
	border-radius: 8px;
	object-fit: cover;
}

.product-details {
	font-size: 14px;
	color: #555;
}

.price {
	font-size: 16px;
	font-weight: bold;
}

.quantity {
	font-size: 16px;
	font-weight: bold;
}

.quantity-dropdown {
	width: 70px;
	border-radius: 4px;
	text-align: center;
}

#btn-chk {
	width: 100%;
	background-color: #fb641b;
	color: white;
	font-size: 18px;
	font-weight: bold;
}

#btn-chk:hover {
	background-color: #fb641b;
	color: white;
}

@media ( max-width : 768px) {
	#Con {
		padding: 15px;
	}
	.product-img {
		width: 220px;
		height: 150px;
	}
	.quantity-dropdown {
		width: 100%;
	}
	.d-flex.align-items-start {
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.d-flex.align-items-end {
		justify-content: center;
		padding: 0;
	}
	.ms-auto {
		margin-left: 0 !important;
	}
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	
	<div class="container my-4" id="ConCar">
		<div class="row">
			<!-- Left Section: Cart Items -->
			<div class="col-lg-8">
				<div class="cart-container" id="Con">
					<h1 class="cart-title">My Cart</h1>
					<%
					if (session.getAttribute("uname") != null)
					%>
					<div class="text-end">
						<a href="Products.jsp" style="color: blue;">Order More</a>
					</div>

					<%
					int count = 0;
					double TotalAmount = 0.0;
					double Discount = 0;
					double PayAmount = 0;
					Methods s1 = new Methods(session);
					ArrayList<Cart> ar = s1.getcartinfo();
					Iterator<Cart> itr = ar.iterator();
					while (itr.hasNext()) {
						Cart s = itr.next();
						count++;
						TotalAmount += Math.round(s.getc_cost() * Integer.parseInt(s.getQuantity()));
						Discount = Math.round(TotalAmount * 0.10);
						PayAmount = Math.round(TotalAmount - Discount);
						session.setAttribute("PayAmount", PayAmount);
					%>
					<form action="AddCartCont" method="post">
						<div class="d-flex align-items-start mb-2">
							<div class="me-3">
								<img src="<%=s.getc_image()%>" alt="Product Image"
									class="product-img">
							</div>
							<div class="flex-grow-3">
								<h6 class="mb-1"><%=s.getc_name()%></h6>
								<p class="product-details mb-0"><%=s.getC_description()%></p>
								<p class="price mb-0">
									$<%=s.getc_cost()%></p>
								<p class="quantity">
									Quantity:<%=s.getQuantity()%></p>
							</div>
							<div class="d-flex align-items-center ms-auto">
								<input type="hidden" name="crtd" value="<%=s.getc_id()%>" /> <input
									type="hidden" name="Cutd"
									Value="<%=session.getAttribute("id")%>" />
								<button type="submit" name="Delete"
									class="btn btn-link text-danger">Remove</button>
					</form>
				</div>

			</div>

			<%
			}
			%>

		</div>

	</div>

	<!-- Right Section: Price Summary -->
	<div class="col-lg-4">
		<div class="cart-container" id="CartCon">
			<h5 class="total-title">Price Details</h5>
			<hr>
			<div class="d-flex justify-content-between">
				<p>
					Price <b><%=count%> items</b>
				</p>
				<p class="text-primary">
					$<%=TotalAmount%></p>
			</div>
			<div class="d-flex justify-content-between">
				<p>Discount</p>
				<p class="text-success">
					-$<%=Discount%></p>
			</div>
			<div class="d-flex justify-content-between">
				<p>Delivery Charges</p>
				<p class="text-success">Free</p>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<p>Total Amount</p>
				<p class="price">
					$<%=PayAmount%></p>
			</div>
			<button type="button" data-bs-toggle="modal"
				data-bs-target="#ConfirmOrderModal" class="btn checkout-btn mt-3"
				id="btn-chk">Place Order</button>

		</div>
	</div>
	</div>
	</div>

	<!-- Confirm Order Modal -->
	<div class="modal fade" id="ConfirmOrderModal" tabindex="-1"
		aria-labelledby="ConfirmOrderModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ConfirmOrderModalLabel"
						style="font-size: larger;">Confirm Your Order</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="confirmOrderForm" action="VerifyOrder" method="post">

						<!-- Captcha Error Message -->
						<%
						String captchaError = (String) session.getAttribute("captchaError");
						if (captchaError != null) {
						%>
						<div class="alert alert-danger text-center" role="alert">
							<%=captchaError%>
						</div>
						<%
						session.removeAttribute("captchaError");
						}
						%>

						<!-- User Details Section -->
						<div class="row mb-3">
							<div class="col-12 col-md-6">
								<label for="userName" class="form-label">Full Name:</label> <input
									type="text" class="form-control" id="userName" name="userName"
									required>
							</div>
							<div class="col-12 col-md-6">
								<label for="userEmail" class="form-label">Email Address:</label>
								<input type="email" class="form-control" id="userEmail" name="Email">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-12">
								<label for="deliveryAddress" class="form-label">Delivery
									Address:</label>
								<textarea class="form-control" id="deliveryAddress"
									name="deliveryAddress" rows="3" required></textarea>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-12 col-md-6">
								<label for="city" class="form-label">City:</label> <input
									type="text" class="form-control" id="city" name="city" required>
							</div>
							<div class="col-12 col-md-6">
								<label for="state" class="form-label">State:</label> <input
									type="text" class="form-control" id="state" name="state"
									required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-12 col-md-6">
								<label for="userPhone" class="form-label">Phone Number:</label>
								<input type="tel" class="form-control" id="userPhone"
									name="Phone" required>
							</div>
							<div class="col-12 col-md-6">
								<label for="zipCode" class="form-label">ZIP Code:</label> <input
									type="text" class="form-control" id="zipCode" name="zipCode"
									required>
							</div>
						</div>

						<!-- Captcha Section -->
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<p class="mb-0" style="font-size: 18px;">Please enter the
									CAPTCHA below:</p>
								<p id="captchaDisplay"
									style="font-size: 18px; font-weight: bold; letter-spacing: 3px;">
									<%=session.getAttribute("captcha")%>
								</p>
							</div>
						</div>
						<div class="mb-3">
							<label for="captchaInput" class="form-label">Enter
								CAPTCHA:</label> <input type="text" class="form-control"
								id="captchaInput" name="captchaInput" required>
						</div>

						<!-- Payment Mode Section -->
						<div class="mb-3">
							<label for="paymentMode" class="form-label">Select
								Payment Mode:</label> <select class="form-control" id="paymentMode"
								name="payMode" required>
								<!-- <option value="creditCard">Credit Card</option>
								<option value="debitCard">Debit Card</option>
								<option value="netBanking">Net Banking</option> -->
								<option value="cashOnDelivery">Cash on Delivery</option>
							</select>
						</div>

						<!-- Modal Footer -->
						<div class="modal-footer">
							<input type="hidden" value="<%=session.getAttribute("id")%>"
								name="pd">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
							<button type="submit" name="captcha" class="btn btn-primary">Confirm
								Order</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Fetch CAPTCHA Script -->
	<script>
    window.onload = function () {
        fetch('GenerateCaptcha')
            .then(response => response.text())
            .then(captcha => {
                document.querySelector('#captchaDisplay').innerText = captcha;
            })
            .catch(error => console.error('Error fetching CAPTCHA:', error));
    };
</script>

	
	<%@ include file="Footer.jsp"%>
</body>
</html>
