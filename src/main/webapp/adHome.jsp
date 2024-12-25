<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.Product"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopCart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">

</head>
<body>

	<%@ include file="adHeader.jsp"%>
	<style>
.product-card {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 16px;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-card img {
	max-width: 100%;
	height: auto;
	border-radius: 8px;
	margin-bottom: 10px;
}

.product-price {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.product-rating {
	color: #28a745;
	font-size: 14px;
	margin-bottom: 10px;
}
</style>


	<div class="container">
		<div class="d-flex justify-content-end mb-3">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#addProductModal">Add Product</button>
		</div>

		<div class="row g-4">
			<%
			Methods s1 = new Methods(session);
			ArrayList<Product> ar = s1.getEventList();
			Iterator<Product> itr = ar.iterator();
			while (itr.hasNext()) {
				Product s = itr.next();
			%>
			<div class="col-md-3">
				<div class="product-card">
					<img alt="Product Image" src="<%=s.getproduct_img()%>">
					<h5><%=s.getproduct_name()%> </h5>
					<p style="font-size:15px;"><%=s.getproduct_details() %></p>
					<div class="product-price"><%=s.getproduct_cost()%></div>
					
				    <form method="post" action="home">
				     <input type="hidden" value="<%=s.getproduct_name()%>" name="pdname">
					<button class="btn btn-danger w-100" name="pdelete">Delete</button>
					</form>
				</div>
			</div>
			<%
			}
			%>
		</div>


	</div>


	<!-- Product add -->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="addProductForm" action="home" method="post">
						<!-- Product Name -->
						<div class="mb-3">
							<label for="productName" class="form-label">Product Name</label>
							<input type="text" class="form-control" id="productName"
								placeholder="Enter product name" name="pname" required>
						</div>
						<!-- Product Description -->
						<div class="mb-3">
							<label for="productDescription" class="form-label">Product
								Description</label>
							<textarea class="form-control" id="productDescription" rows="3"
								placeholder="Enter product description" name="pdescription"
								required></textarea>
						</div>
						<!-- Product Price -->
						<div class="mb-3">
							<label for="productPrice" class="form-label">Price ($)</label> <input
								type="number" class="form-control" id="productPrice"
								placeholder="Enter product price" name="pcost" required>
						</div>
						<!-- Product Image -->
						<div class="mb-3">
							<label for="productImage" class="form-label">Product
								Image</label> <input type="text" class="form-control" id="productImage"
								placeholder="Enter product url" name="pimage" required>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary"
								form="addProductForm" name="adProduct">Save Product</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>



	<%@ include file="Footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
