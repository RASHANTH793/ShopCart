<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopCart</title>
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
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

.container {
	margin-top: 50px;
}

h2 {
	font-size: 2.5rem;
	font-weight: bold;
	text-align: center;
	margin-bottom: 40px;
	color: #fff;
}

/* Table Styles */
.table-container {
	background-color: #fff;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

.table {
	width: 100%;
	margin-bottom: 0;
	border-collapse: collapse;
}

.table thead th {
	background-color: #34b3a0;
	color: white;
	text-align: center;
	font-weight: bold;
	padding: 10px;
}

.table tbody tr {
	border-bottom: 1px solid #ddd;
}

.table tbody tr:nth-child(even) {
	background-color: #f8f9fa;
}

.table tbody tr:hover {
	background-color: #e9f5f5;
}

.table tbody td {
	padding: 10px;
	text-align: center;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.table thead {
		display: none;
	}
	.table tbody tr {
		display: block;
		margin-bottom: 20px;
	}
	.table tbody td {
		display: flex;
		justify-content: space-between;
		padding: 10px 15px;
		border-bottom: 1px solid #ddd;
	}
	.table tbody td:before {
		content: attr(data-label);
		font-weight: bold;
		flex: 1;
		text-align: left;
	}
}
</style>
</head>
<body>

	<div class="container">
		<h2>Client Details</h2>

		<div class="table-container">
			<table class="table">
				<thead>
					<tr>
						<th>Slno</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td data-label="#">1</td>
						<td data-label="Client Name">John Doe</td>
						<td data-label="Email">johndoe@example.com</td>
						<td data-label="Phone">(123) 456-7890</td>
						<td data-label="Address">123 Main St, Cityville</td>
						<td data-label="Status"><span class="badge bg-success">Active</span>
						</td>
						<td data-label="Actions">
							<button class="btn btn-primary btn-sm">View</button>
							<button class="btn btn-warning btn-sm">Edit</button>
							<button class="btn btn-danger btn-sm">Delete</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
