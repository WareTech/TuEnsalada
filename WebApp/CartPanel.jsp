<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Giftcard"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.ProductProduct"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.Iterator"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%
Cart cart = WebUtils.getCart(request);
%>
<h2>TU CARRITO</h2>
<div class="tE-table" id="tE-cart-table">
	<%@include file="MessagePanel.jsp"%>
	<div class="tE-row">
		<div class="tE-box-top tE-cellProduct tE-cell">
			<a href="#" onclick="Cart_clear();"><img src="img/carrito.png"></a>
			<span><%= cart.getProducts().size() %> <%= cart.getProducts().size() == 1 ? "ensalda" : "ensaladas" %></span> en tu carrito
		</div>
		<div class="tE-box-top tE-cellItem tE-cell">Postre</div>
		<div class="tE-box-top tE-cellItem tE-cell">Bebida</div>
		<div class="tE-box-top tE-cellItem tE-cell">Subtotal</div>
		<div class="tE-box-top tE-cellItem tE-cell"></div>
	</div>
<%
Iterator productIterator = cart.getProducts().iterator();
Product product;
while(productIterator.hasNext())
{
	product = (Product) productIterator.next();
	if (product.getId().longValue() > 0)
	{
		product = (Product) Database.getCurrentSession().get(Product.class, product.getId());
	}
%>						
	<div class="tE-row">
		<div class="tE-cellProduct tE-cell">
			<%= product.getName() %>
			<br>
			<span><%= PurchaseUtil.toString(product) %></span>
		</div>
		<div class="tE-cellItem tE-cell">
<%
	Product dessert = null;
	if (product.getType().equals(Constants.PRODUCT_TYPE_DESSERT))
	{
		dessert = product;
	}
	else
	{
		Iterator productProductIterator = product.getChildren().iterator();
		ProductProduct productProduct;
		while(productProductIterator.hasNext())
		{
			productProduct = (ProductProduct) productProductIterator.next();
			if (productProduct.getChild().getType().equals(Constants.PRODUCT_TYPE_DESSERT))
			{
				dessert = productProduct.getChild();
				break;
			}
			else if (productProduct.getChild().getType().equals(Constants.PRODUCT_TYPE_MENU))
			{
				dessert = (Product) product.getAbstractParamaterMap().get(productProduct.getChild().getId() + "_" + Constants.PRODUCT_TYPE_DESSERT);
				break;
			}
		}
	}
%>
		<%= dessert == null ? "-" : dessert.getName() %></br><span><%= dessert == null ? "-" : dessert.getDescription() %></span>
	</div>
	<div class="tE-cellItem tE-cell">
<%
	Product drink = null;
	if (product.getType().equals(Constants.PRODUCT_TYPE_DRINK))
	{
		drink = product;
	}
	else
	{
		Iterator productProductIterator = product.getChildren().iterator();
		ProductProduct productProduct;
		while(productProductIterator.hasNext())
		{
			productProduct = (ProductProduct) productProductIterator.next();
			if (productProduct.getChild().getType().equals(Constants.PRODUCT_TYPE_DRINK))
			{
				drink = productProduct.getChild();
				break;
			}
			else if (productProduct.getChild().getType().equals(Constants.PRODUCT_TYPE_MENU))
			{
				drink = (Product) product.getAbstractParamaterMap().get(productProduct.getChild().getId() + "_" + Constants.PRODUCT_TYPE_DRINK);
				break;
			}
		}
	}
%>
			<%= drink == null ? "-" : drink.getName() %></br><span><%= drink == null ? "-" : drink.getDescription() %></span>
		</div>
		<div class="tE-cellItem tE-cell"><span>$ <%= Constants.NUMBER_FORMAT.format(product.getPrice()) %></span></div>
		<div class="tE-cellButton tE-cell">
			<input class="btEditItem" type="button" onclick="Cart_editProduct(<%= product.getId() %>)">
			<input type="button" value="x" onclick="Cart_removeProduct(<%= product.getId() %>)">
		</div>
	</div>
<%
}
	
Iterator giftcardIterator = cart.getGiftcards().iterator();
Giftcard giftcard;
while(giftcardIterator.hasNext())
{
	giftcard = (Giftcard) giftcardIterator.next();
%>						
	<div class="tE-row">
		<div class="tE-cellProduct tE-cell">Giftcard</br><span><%= giftcard.getCode() %></span></div>
		<div class="tE-cellItem tE-cell"></br><span></span></div>
		<div class="tE-cellItem tE-cell"></br><span></span></div>
		<div class="tE-cellItem tE-cell">&nbsp;&nbsp;&nbsp;Hasta</br><span>$ <%= Constants.NUMBER_FORMAT.format(giftcard.getAmount()) %></span></div>
		<div class="tE-cellButton tE-cell"><input class="btEditItem" type="button" value=""><input type="button" value="x" onclick="Cart_removeGiftcard(<%= giftcard.getId() %>)"></div>
	</div>
<%
}
%>						
	</div>
	
	<div class="tE-cart-button tE-box-bottom">
		<button class="tE-button-addNew tE-button" type="button" value="" onclick="document.location = 'SaladCreate.jsp'">Armar una<br>Nueva</button>
		<button class="tE-button-addNew tE-button" type="button" value="" onclick="document.location = 'SuggestionsView.jsp'">Agregar una<br>Sugerida</button>
		<button class="tE-button-addNew tE-button" type="button" value="" onclick="openGiftcardPopup();">Agregar <br>Cup&oacute;n</button>
		<span>$ <%= Constants.NUMBER_FORMAT.format(cart.getTotal()) %></span>
		<input class="tE-button-add tE-button" type="button" onclick="Cart_purchase();" value="Comprar">
	</div>
</div>
