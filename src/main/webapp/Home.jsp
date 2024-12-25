<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShopCart</title>
<link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
<style type="text/css">
.category-card {
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	padding: 20px;
	color: white;
	font-weight: bold;
	background-size: cover;
	background-position: center;
	height: 250px;
	transition: transform 0.4 ease;
	cursor:pointer;
}

.category-card:hover {
	transform: scale(1.1);
	/* Scale up on hover */
}

.furniture {
	background:
		url('https://img.freepik.com/free-photo/bunch-fresh-vegetables-stone-table-high-quality-photo_114579-26907.jpg?t=st=1733136957~exp=1733140557~hmac=eb1fa40e4b00fed37e0b66ba0b01a53a62d27204b9ad277777a70b281b98e6db&w=360');
	background-size: contain;
}

.handbag {
	background:
		url('https://img.freepik.com/free-photo/high-angle-vegetables_23-2149198286.jpg?t=st=1733137147~exp=1733140747~hmac=0102c97ea297ec2ac927162c37e53269cdaf2b518d8ae3ee4d158fb025e17f33&w=360');
	background-size: contain;
}

.books {
	background:
		url('https://img.freepik.com/free-photo/carrots-beetroot-top-view_23-2148253287.jpg?t=st=1733137337~exp=1733140937~hmac=cd07cf438e7d19043663ed02da576b5f3c02571de65efe7ae7da21b468fbd689&w=360');
	background-size: contain;
}

.tech {
	background:
		url('https://img.freepik.com/free-photo/half-top-view-fresh-hazelnuts-with-pumpkin-seeds-wooden-desk-nut-color-photo_140725-73144.jpg?t=st=1733137639~exp=1733141239~hmac=b7086412a682aa62786e8117761f09af16a7a6ef2696fcd87a543c99ae86f502&w=360');
	background-size: contain;
}

.sneakers {
	background:
		url('https://img.freepik.com/free-photo/different-seasonal-autumn-vegetables-fruits-wooden-background_1220-1651.jpg?t=st=1733138082~exp=1733141682~hmac=d3069db725c969a6089b217f5f996fbe6b3d20ccb62e0b5fde83513c200ef98d&w=360');
	background-size: contain;
}

.travel {
	background:
		url('https://img.freepik.com/free-photo/high-angle-basket-with-potatoes_23-2148599939.jpg?t=st=1733138165~exp=1733141765~hmac=fce129aae08fc6df187912988583bb07b622933621dcc75ee1d4f3ced0fdd395&w=360');
	background-size: contain;
}

#btn1:hover {
	color: white;
	background-color: brown;
}

.category-card-service {
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	padding: 20px;
	font-weight: bold;
	background-size: cover;
	background-position: center;
	height: 400px;
	width: 400px;
	transition: transform 0.4 ease;
}

img {
	padding: 0;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<div class="position-relative text-center image-container">
		<img
			src="https://img.freepik.com/free-photo/flat-lay-vegetables-frame_23-2148516769.jpg?t=st=1733060776~exp=1733064376~hmac=8ba888aa626a0e0cbe10eca5d422f26d38cc7806cccb9a78f9086972f91d10d8&w=1380"
			alt="Organic Super Market" class="img-fluid w-100">
		<div
			class="position-absolute top-50 start-0 translate-middle-y text-black px-5">
			<h2 class="display-1 fw-thin">
				<span class="custom-font">Organic</span> <br> Super Market
			</h2>
			<p class="fs-5 mt-3 custom-text">Organic  the best way to stuff
				your wallet && Eating naturally is always healthy.</p>
			<a href="Products.jsp"><button id="btn1"
					style="border: 2px solid white; border-radius: 5px;">Order
					Now</button></a>
		</div>
	</div>

	<div class="container-fluid mt-5" id="Categories">
		<h6 class="text-center mb-4">Shop Our Top Categories</h6>
	</div>
	<div class="container py-5">
		<div class="row g-3 ml-5" style="margin-left: 40px;">
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card furniture">Leafy's vegetables</div>
			</div>
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card handbag">Flower vegetables</div>
			</div>
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card books">Root vegetables</div>
			</div>
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card tech">Pod and seed vegetables</div>
			</div>
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card sneakers">Fruit vegetables</div>
			</div>
			<div class="col-6 col-md-4 col-lg-2">
				<div class="category-card travel">Tuber vegetables</div>
			</div>
		</div>
	</div>
	<div class="container-fluid mt-3" id="Delivery">
		<h6 class="text-center mb-5">Services To Help You Shop</h6>
	</div>
	<div class="container  ">
		<div class="row mx-auto">
			<div class="col-md-4">
				<div class="category-card-service Questions bg-light text-black p-0">
					<h5 class="mt-5">Frequently Asked Question</h5>
					<p style="font-size: 15px; font-weight: lighter;">Updates on
						safe Shopping in our Stores</p>
					<img class="mt-3"
						src="https://img.freepik.com/free-photo/pretty-woman-with-cabbage_23-2147700626.jpg?t=st=1733146251~exp=1733149851~hmac=7a29d7f9f4e1a820282e4dbc8e2410bc5a57fda6eb8eb20e962b8fd89bdfeb86&w=1060"
						alt="" style="width: 100%; height: 300px;">
				</div>
			</div>
			<div class="col-md-4">
				<div
					class="category-card-service OnlinePayment bg-light text-black p-0">
					<h5 class="mt-5">Online Payment</h5>
					<p style="font-size: 15px; font-weight: lighter;">Emphasize the
						simplicity and speed of using online payments.</p>
					<img class="mt-3"
						src="https://media.istockphoto.com/id/1365704727/photo/shopping-groceries-online.jpg?s=612x612&w=0&k=20&c=5eq3tzQDf_T-3cfXqeLhekTKvhCFGP4Bf7j4WK8jt8E="
						alt="" style="width: 100%; height: 300px;">
				</div>
			</div>
			<div class="col-md-4">
				<div class="category-card-service  Delivery bg-light text-black p-0">
					<h5 class="mt-5">Home Delivery</h5>
					<p style="font-size: 15px; font-weight: lighter;">Freshness
						That Comes Home to You.</p>
					<img class="mt-3"
						src="https://img.freepik.com/free-photo/medium-shot-man-delivering-food_23-2148767104.jpg?t=st=1733147496~exp=1733151096~hmac=efbb758d87191ff8d3fb40ac181d8a9df2fbfe5eb8fe7cf2a2efa23e3422f5ca&w=1060"
						alt="" style="width: 100%; height: 300px;">
				</div>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>