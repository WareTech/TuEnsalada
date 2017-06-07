<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<title>Tu Ensalada - Home</title>
		<meta content="width=device-width" name="viewport">
		
		<link href="css/normalize.css" rel="stylesheet">
		<link href="css/layout.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet">
	
		<script src="js/jquery-1.8.0.min.js"></script>
		<script src="js/jquery.blockUI.js"></script>
		<script src="js/jquery-ui-1.9.1.custom.min.js"></script>
		<script src="js/modernizr-2.6.1.min.js"></script>
		<script src="js/script.js"></script>
	</head>
	<body>
		<header>
			<%@include file="AdminPanel.jsp"%>
		</header>
		
		<section id="tE-banner" style="height: 442px">
			<ul>
				<li id="tE-banner1" class="">
					<a class="" href="#">
					<img src="img/banner1.jpg">
					<input class="tE-button-quiero tE-button" type="button" value="Quiero!">
					</a>
				</li>
				<li id="tE-banner2" class="">
					<a class="" href="#">
					<img src="img/banner2.jpg">
					</a>
				</li>
				<li id="tE-banner3" class="">
					<a class="" href="#">
					<img src="img/banner3.jpg">
					</a>
				</li>
			</ul>
			<div id="tE-banner-control">
				<a class="current control" rel="0"> </a>
				<a class="control" rel="1"> </a>
				<a class="control" rel="2"> </a>
			</div>
		</section>
		
		<section id="tE-content-bg">
			<div id="tE-main-content">
				
				<div class="tE-box-content">
					<div class="tE-box">
						<a href="#"><img src="img/box1.png" title="Las sugerencias del chef"></a>
					</div>
					<div class="middle tE-box">
						<a href="#"><img src="img/box2.png" title="Nuevo Delivery Pack"></a>
					</div>
					<div class="tE-box">
						<a href="#"><img src="img/box3.png" title="Radio de Delivery Verde"></a>
					</div>
				</div>
				
				<div class="tE-footer-content tE-box-content">
					<div class="tE-box">
						<h5>Info</h5>
						<p>-</br>
						info@tuensalada.com.ar</br>
						(+54) 4444-5555
						-</br></br>
						Oficinas comerciales</br>
						calle calle 1212</br>
						1244, Buenos Aires</br></br>
						Tu Ensalada. Copyright 2012
						</p>
					</div>
					<div class="middle tE-box">
						<h5>Lo &uacute;ltimo en Facebook</h5>
						<p>
						Hace 2hs.</br>
						<div class="dotted"><img src="img/bt-facebook.png"></div>
						</p>
						<p>Esta semana, comprando dos &oacute; m&aacute;s ensaladas te llev&aacute;s de regalo una coca o sprite de litro y medio. Qu&ueacute; est&aacute;s esperando?
						</p>
						</br></br>
						<h5>Lo &uacute;ltimo en Twitter</h5>
						<p>
						Hace 5hs.</br>
						<div class="dotted"><img src="img/bt-twitter.png"></div>
						</p>
						<p>Esta semana, comprando dos &oacute; m&aacute;s ensaladas te llev&aacute;s de regalo una coca o sprite de litro y medio. Qu&eacute; est&aacute;s esperando?
						</p>
					</div>
					<div class="tE-box">
						<h5>Mailing</h5>
						<p>-</br>
						Enterate de todas nuestras novedades, promociones y descuentos
						</br>-</br>
						<input type="text" value="E-mail">
						</p>
					</div>
				</div>
				
			</div>
		</section>
	</body>
</html>