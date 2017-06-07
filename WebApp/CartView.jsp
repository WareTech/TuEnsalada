<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Armá Tu Ensalada</title>
		<meta content="width=device-width" name="viewport">
		
		<link href="css/normalize.css" rel="stylesheet">
		<link href="css/layout.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet">
	
		<script src="js/jquery-1.8.0.min.js"></script>
		<script src="js/modernizr-2.6.1.min.js"></script>
		<script src="js/script.js"></script>
	</head>
	<body>
		<header>
			<%@include file="HeaderPanel.jsp"%>
		</header>
		<section id="tE-banner" class="">
			<img src="img/bannerInterior_Carrito.jpg">
		</section>
		<section id="tE-content-bg" class="tE-content-bgUp">
			<div id="tE-main-content" class="tE-cart-content">
				<div class="tE-box-content">
					<div id="cartPanel" class="tE-white-box">
						<%@include file="CartPanel.jsp"%>
					<div class="tE-white-box-bg-footer"></div>
				</div>
			</div>
		</section>
	</body>
</html>