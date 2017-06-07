<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>

<div id="popup" style="display: none" class="popup">
	<div class="message">
		<div class="header">
			<a href="javascript:void(0);" onclick="closePopup()"><u>Cerrar</u></a>
		</div>
		<div class="content">
		</div>
	</div>
</div>

<div id="processing" style="display: none" class="popup">
	<div class="processingPopup">
		<img alt="Procesando..." src="img/processing.gif">
	</div>
</div>

<div id="closed" style="display: none" class="popup">
	<div class="closedPopup">
		<img alt="Cerrado" src="img/cerrado.png">
	</div>
</div>

<div id="GiftcardPopup" style="display: none" class="popup">
	<div class="message">
		<div class="header">
			<a href="javascript:void(0);" onclick="closeGiftcardPopup()"><u>Cerrar</u></a>
		</div>
		<div class="content">
			Ingres&aacute; Tu Cup&oacute;n
			<input type="text" id="giftcard" name="giftcard" value="">
			<input type="button" name="send" value="Enviar" onclick="closeGiftcardPopup(); Cart_addGiftcard()">
		</div>
	</div>
</div>

<div id="tE-header-content"> 
	
	<div id="tE-header-logo">
		<a href="index.jsp"><img src="img/tE-logo.png" title="Tu Ensalada"></a>
	</div>
	
	<%@include file="LoginPanel.jsp"%>
	
	<nav id="tE-header-nav">
		<ul>
<%
if (WebUtils.checkAuthorization(request, "Admin.jsp"))
{
%>
			<li>
				<a onclick="openProcessingPopup()" href="Admin.jsp">ADMIN</a>
			</li>
<%
}
%>
			<li>
				<a onclick="openProcessingPopup()" href="SaladCreate.jsp">ARM&Aacute; TU ENSALADA</a>
			</li>
			<li>
				<a onclick="openProcessingPopup()" href="SuggestionsView.jsp">NUESTRAS SUGERENCIAS</a>
			</li>
			<li>
				<a onclick="openProcessingPopup()" href="FavoritesView.jsp">TUS FAVORITOS</a>
			</li>
			<li class="tE-carrito-nav">
<%
int cartSize = WebUtils.getCart(request).getProducts().size();
%>			
				<a onclick="openProcessingPopup()" href="CartView.jsp">
					<span id="cartLabel">CARRITO <%= cartSize > 0 ? "(" + cartSize + ")" : "" %></span>
					<img src="img/carrito-white.png">
				</a>
			</li>
		</ul>
	</nav>
</div>	
