<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.Product"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart</title>
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
	integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css"
	integrity="sha512-6f7HT84a/AplPkpSRSKWqbseRTG4aRrhadjZezYQ0oVk/B+nm/US5KzQkyyOyh0Mn9cyDdChRdS9qaxJRHayww=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<style type="text/css">
.container img {
	width: 100%;
	height: 250px;
	display: block;
	max-width: 100%;
}

.product-card {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 10px;
	text-align: left;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-card img {
	max-width: 100%;
	height: auto;
	border-radius: 8px;
	margin-bottom: 10px;
}

.product-price {
	font-size: 15px;
	font-weight: bold;
	color: #333;
}

.quantity-dropdown {
	width: 100%;
	border-radius: 4px;
	text-align: center;
	padding: 5px;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
		<img alt="Responsive Banner" src="Banner.png" class="img-fluid">
	</div>
	<div class="container mt-5" id="Categories">
		<h6 class="text-left mb-4">Shop Our Top Categories</h6>
	</div>
	<div class="container">
		<div class="row g-4">
			<%
			Methods s1 = new Methods(session);
			ArrayList<Product> ar = s1.getEventList();
			Iterator<Product> itr = ar.iterator();
			while (itr.hasNext()) {
				Product s = itr.next();
			%>
			<div class="col-md-3">
			<form action="AddCartCont" method="post">
				<div class="product-card">
					<img alt="Product Image" src="<%=s.getproduct_img()%>">
					<h5 class="text-left" style="color: #585478;"><%=s.getproduct_name()%></h5>
					<p style="font-size: 15px;"><%=s.getproduct_details()%></p>
					<div class="product-price">
						Cost: $<%=s.getproduct_cost()%>
					</div>
					<div class="quantity-section mt-2">
						<label for="quantity<%=s.getproduct_id()%>"
							style="margin-right: 10px;font-weight: bold;">Quantity:</label> <select
							name="quantity" id="quantity<%=s.getproduct_id()%>"
							class="form-select d-inline-block w-auto quantity-dropdown">
							<%
							for (int i = 1; i <= 10; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select>
					</div>
					<div class="text-end mt-3">
						<form action="AddCartCont" method="post">
							<input type="hidden" name="productID"
								value="<%=s.getproduct_id()%>" />
							<%
							if (session.getAttribute("uname") != null) {
							%>
							<button class="btn btn-primary w-10 mt-2" name="PCart">Add
								to Cart</button>
							<%
							} else {
							%>
							<h6 class="text-center mt-3"
								style="font-weight: thin; font-size: larger;">Please Login
								to Order</h6>
							<%
							}
							%>
						</form>
					</div>
				</div>

			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>
