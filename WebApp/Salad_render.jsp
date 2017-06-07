<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.ProductProduct"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.Iterator"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>

<%
Product product = WebUtils.getProduct(request);
%>

<div class="tE-right-box tE-box">
	<div class="tE-right-boxes-container">
	<div class="tE-white-box">
		<h2 id="cuenta">TU CUENTA</h2>
		
		<div class="tE-box-top">
		<a href="#"><img src="img/carrito.png" onclick="Salad_clear(); return false;"></a>
		<span><%= product.ingredientCount() %> ingredientes</span> en tu ensalada
		</div>
		
		<div class="tE-table" id="tE-count-table">
<%
Iterator productProductIterator = product.getChildren().iterator();
ProductProduct productProduct = null;
while(productProductIterator.hasNext())
{
	productProduct = (ProductProduct) productProductIterator.next();
	if (!productProduct.getChild().isIngredient())
	{
		continue;
	}
%>
			<div class="tE-row">
				<div class="tE-cellProduct tE-cell">
					<%= productProduct.getChild().getName() %></br>
					<span><%= productProduct.getCount() %> x $<%= Constants.NUMBER_FORMAT.format(productProduct.getChild().getPrice()) %></span>
				</div>
				<div class="tE-cellButton tE-cell">
					<input type="button" value="x" onclick="Salad_removeProduct(<%= productProduct.getChild().getId() %>)">
				</div>
			</div>
<%
}
%>
		</div>

		<div class="tE-box-top" style="text-align: left">... y adem&aacute;s</div>
		
		<div class="tE-table" id="tE-count-table">
<%
productProductIterator = product.getChildren().iterator();
while(productProductIterator.hasNext())
{
	productProduct = (ProductProduct) productProductIterator.next();
	if (productProduct.getChild().isIngredient())
	{
		continue;
	}
	if (productProduct.getChild().isAbstract())
	{
		continue;
	}
%>
			<div class="tE-row">
				<div class="tE-cellProduct tE-cell">
					<%= productProduct.getChild().getName() %><br>
					<span><%= productProduct.getCount() %> x $<%= Constants.NUMBER_FORMAT.format(productProduct.getChild().getPrice()) %></span>
				</div>
				<div class="tE-cellButton tE-cell">
					<input type="button" value="x" onclick="Salad_removeProduct(<%= productProduct.getChild().getId() %>)">
				</div>
			</div>
<%
	if (productProduct.getChild().isMenu())
	{
		Product menuProduct = (Product) Database.getCurrentSession().get(Product.class, productProduct.getChild().getId());
		Iterator menuProductProductIterator = menuProduct.getChildren().iterator();
		ProductProduct menuProductProduct;
		while(menuProductProductIterator.hasNext())
		{
			menuProductProduct = (ProductProduct) menuProductProductIterator.next();
			if (!menuProductProduct.getChild().isAbstract())
			{
				continue;
			}
%>
			<div class="tE-row">
				<div class="tE-cellProduct tE-cell">
<% 
			Product concreteProduct = (Product) product.getAbstractParamaterMap().get(productProduct.getChild().getId() + "_" + menuProductProduct.getChild().getType());
			if (concreteProduct == null)
			{
%>
					<i>
						<a href="SuggestionsView.jsp?productType=1,2,7,8,6&selectedType=<%= menuProductProduct.getChild().getType() %>">
							<%= menuProductProduct.getChild().getName() %>
						</a>
					</i>
					<br>
					<span><%= productProduct.getCount() %> x $<%= Constants.NUMBER_FORMAT.format(menuProductProduct.getChild().getPrice()) %></span>
				</div>
				<div class="tE-cellButton tE-cell">
				</div>
<%
			}
			else
			{
%>
					<%= menuProductProduct.getChild().getName() %>&nbsp;(<%= concreteProduct.getName() %>)
					<br>
					<span><%= productProduct.getCount() %> x $<%= Constants.NUMBER_FORMAT.format(menuProductProduct.getChild().getPrice()) %></span>
				</div>
				<div class="tE-cellButton tE-cell">
					<input type="button" value="x" onclick="Salad_removeAbstractProduct(<%= productProduct.getChild().getId() %>, <%= menuProductProduct.getChild().getType() %>)">
				</div>
<%
			}
%>
			</div>
<%
		}
	}
}
%>
		</div>
		
		<p>Decinos para qui&eacute;n es esta ensalada. </br>Va impreso en el nombre del pedido</br>
		Si es para vos dejalo en blanco
			<input id="saladName" type="text" value="Nombre" onmousedown="this.value = ''">
		</p>
		
		<div class="tE-box-bottom">
			Subtotal:</br>
			<span>$ <%= Constants.NUMBER_FORMAT.format(product.getPrice()) %></span>
<%
Cart cart = WebUtils.getCart(request);
%>
			<button id="Salad_create" class="tE-button-add tE-button" onclick="Salad_create()">
				Agregar al<br>Carrito<%= cart.getProducts().size() > 0 ? " (" + cart.getProducts().size() + ")" : "" %>
			</button>
		</div>
	</div>
	
	<div class="tE-white-box-bg-footer"></div>

	<div class="tE-black-box">
		<h3>¿UN NUEVO HIT?</h3>
		<p>Ponele nombre y guardala para la pr&oacute;xima</p>
		<input type="text" value="">
		
		<div class="tE-box-bottom">
			<img src="img/heart.png">
			Ten&eacute;s:</br>
			<span>0 favoritos</span>
			<input class="tE-button-save tE-button" type="button" value="Guardar">
		</div>
		
	</div>
	
	</div>
</div>
