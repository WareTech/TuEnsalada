<!DOCTYPE html>
<%@page import="java.util.SimpleTimeZone"%>
<%@page import="java.util.Calendar"%>
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
<%
if (Configuration.getBoolean("SITE_CLOSED", false))
{
%>		
		<script>
		$(document).ready(function() {
			openClosedPopup();
			});
		</script>
<%
}
%>		
	</head>
	<body>
		<header>
			<%@include file="HeaderPanel.jsp"%>
		</header>
		
		<section id="tE-banner" style="height: 442px">
			<ul>
				<li id="tE-banner1" class="">
					<a class="" href="#">
						<img id="banner" src="img/banner1.jpg">
						<input class="tE-button-quiero tE-button" type="button" value="Quiero!" onclick="Home_quiero(<%= Configuration.getString("HOME_QUIERO") %>)">
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
				<a class="current" rel="1" onclick="$('#tE-banner1').show(); $('#tE-banner2').hide(); $('#tE-banner3').hide();"> </a>
				<a class="control control" rel="0" onclick="$('#tE-banner2').show(); $('#tE-banner1').hide(); $('#tE-banner3').hide();"> </a>
				<a class="control" rel="2" onclick="$('#tE-banner3').show(); $('#tE-banner1').hide(); $('#tE-banner2').hide();"> </a>
			</div>
		</section>
		
		<section id="tE-content-bg">
			<div id="tE-main-content">
				
				<div class="tE-box-content">
					<div class="tE-box">
						<a href="SuggestionsView.jsp"><img src="img/box1.png" title="Las sugerencias del chef"></a>
					</div>
					<div class="middle tE-box">
						<a href="#"><img src="img/box2.png" title="Nuevo Delivery Pack"></a>
					</div>
					<div class="tE-box">
						<a href="Map.jsp"><img src="img/box3.png" title="Radio de Delivery Verde"></a>
					</div>
				</div>
				
				<%@include file="FooterPanel.jsp"%>
				
			</div>
		</section>
	</body>

	<%@include file="MessagePanel.jsp"%>
	
</html>