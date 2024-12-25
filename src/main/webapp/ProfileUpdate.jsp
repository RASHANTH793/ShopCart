<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ShopCart.Methods.Methods"%>
<%@page import="com.ShopCart.Pojo.UserDetails"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Update</title>
<link rel="icon" type="image"
	href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
/* General Styles */
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background: linear-gradient(to bottom right, #34b3a0, #5574e6);
	min-height: 100vh;
	color: white;
}

#updateProfileContainer {
	margin-top: 50px;
	max-width: 600px;
}

#updateProfileCard {
	border-radius: 15px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

#updateProfileHeader {
	background-color: #34b3a0;
	color: white;
	font-size: 1.5rem;
	font-weight: bold;
	text-align: center;
	padding: 15px;
}

#updateProfileBody {
	background-color: white;
	color: #333;
	padding: 20px;
}

#updateProfileForm label {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

#updateProfileForm input[type="text"], #updateProfileForm input[type="email"],
	#updateProfileForm input[type="tel"], #updateProfileForm textarea {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 10px;
	width: 100%;
	margin-bottom: 15px;
	transition: border-color 0.3s ease;
}

#updateProfileForm input:focus, #updateProfileForm textarea:focus {
	border-color: #34b3a0;
	outline: none;
}

#updateProfileButton {
	background-color: #34b3a0;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 25px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

#updateProfileButton:hover {
	background-color: #2a927c;
}

@media ( max-width : 768px) {
	#updateProfileBody {
		padding: 15px;
	}
}
</style>
</head>
<%@ include file="Header.jsp"%>
<body>

	<div id="updateProfileContainer" class="container">
		<div id="updateProfileCard" class="card">
			<div id="updateProfileHeader" class="card-header">Update
				Profile</div>
			<div id="updateProfileBody" class="card-body">
				<%
				if (session.getAttribute("uname") != null) {
					Methods reg = new Methods(session);
					UserDetails s = reg.getInfo();
				%>
				<form id="updateProfileForm" action="home" method="post">
					<!-- Name -->
					<div class="mb-3">
						<label for="name">Full Name</label> <input type="text" id="name"
							name="name" placeholder="Enter your full name" value="<%=s.getName()%>">
					</div>

					<!-- Email -->
					<div class="mb-3">
						<label for="email">Email</label> <input type="email" id="email"
							name="email" placeholder="Enter your email" value="<%=s.getEmail()%>">
					</div>

					<!-- Phone -->
					<div class="mb-3">
						<label for="phone">Phone</label> <input type="tel" id="phone"
							name="phone" placeholder="Enter your phone number"
							value="<%=s.getPhone()%>">
					</div>

					<div class="mb-3">
						<label for="phone">City</label> <input type="text" id="phone"
							name="city" placeholder="Enter your City"
							value="<%=s.getCity()%>">
					</div>

					<!-- Address -->
					<div class="mb-3">
						<label for="address">Address</label>
						<textarea id="address" name="address" rows="3"
							placeholder="Enter your address" ><%=s.getAddress() %></textarea>
					</div>

					<!-- Submit Button -->
					<div class="text-center">
						<button id="updateProfileButton" type="submit"
							name="UpdateProfile">Update Profile</button>
					</div>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
