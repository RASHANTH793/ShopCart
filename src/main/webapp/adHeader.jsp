<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css"
        integrity="sha512-6f7HT84a/AplPkpSRSKWqbseRTG4aRrhadjZezYQ0oVk/B+nm/US5KzQkyyOyh0Mn9cyDdChRdS9qaxJRHayww=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
        
<!-- script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> --> 
        
</head>
<style>
    nav {
        display: flex;
        width: 100%;
    }

    #con {
        display: flex;
    }

    ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;

    }

    ul li {
        margin-right: 20px;
    }

    ul li a {
        color: black;
        font-weight: 600;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    p {
        font-weight: bolder;
        font-size: larger;
    }

    

    .custom-font {
        font-family: 'Brush Script MT', cursive;
        font-size: 6rem;
    }

    .custom-text {
        font-size: 1.2rem;

    }

    .image-container img {
        height: auto;
        /* Makes the height responsive */
        object-fit: cover;
        /* Ensures proper aspect ratio */
        max-height: 600px;
        /* Limits maximum height for larger screens */
    }

    @media (max-width: 768px) {
        .custom-font {
            font-size: 2.5rem;
            /* Adjust font size for smaller screens */
        }

        .custom-text {
            font-size: 1rem;
            /* Adjust text size for smaller screens */
        }
    }
    </style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand p-0 mt-2" href="Home.jsp" style="margin-left: 70px;">
			<img
			src="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg"
			width="60" height="50" class="d-inline-block align-center" alt="">
			Shopcart
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#Compress01" aria-controls="Compress01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="Compress01">
			<div class="container" id="con">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item "><a class="nav-link" href="adHome.jsp">Home<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#Categories">Deal's</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Clients.jsp">Clients</a></li>
					<li class="nav-item"><a class="nav-link" href="#Delivery">Delivery</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="adManageOrders.jsp">Manage Book Items</a>
					
				</ul>
				
				<% if(session.getAttribute("uname")!= null) { %>
				<div class="dropdown mt-2">
					<button class="btn  dropdown-toggle" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false" style="color: black;border:none;">
						<i class="fi fi-ss-user"></i> Account
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="home?logout=yes">Logout</a></li>
					</ul>
				</div>
				<%} else{%>
				<ul class="navbar-nav">
				   <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
					</li>
				</ul>
				
				<%} %>
				
			</div>
		</div>
	</nav>

</body>
</html>