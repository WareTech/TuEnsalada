<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.ArrayUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.criterion.*"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.*"%>
<%
Criteria productCriteria = Database.getCurrentSession().createCriteria(Product.class);
productCriteria.add(Expression.eq("status", Constants.PRODUCT_STATUS_ACTIVE));

String productTypeString = request.getParameter("productType");
Integer[] productType;
if (productTypeString == null)
{
	//productType = Constants.PRODUCT_TYPE_ALL;
	productType = new Integer[]{Constants.PRODUCT_TYPE_MENU, Constants.PRODUCT_TYPE_SALAD, Constants.PRODUCT_TYPE_DRESSING, Constants.PRODUCT_TYPE_DESSERT, Constants.PRODUCT_TYPE_DRINK};
}
else
{
	productType = ArrayUtils.toIntegerArray(productTypeString);
}

String selectedTypeString = request.getParameter("selectedType");
Integer[] selectedType;
if (selectedTypeString == null)
{
	selectedType = new Integer[]{productType[0]};
}
else
{
	selectedType = ArrayUtils.toIntegerArray(selectedTypeString);
}
productCriteria.add(Expression.in("type", selectedType));
productCriteria.add(Expression.isNull("user"));
productCriteria.addOrder(Order.asc("name"));
List productList = productCriteria.list();

%>
<html>
	<meta charset="UTF-8" http-equiv="Content-Type">
	<title>Tu Ensalada - Armá Tu Ensalada</title>
	<meta content="width=device-width" name="viewport">
	
	<link href="css/normalize.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">

	<script src="js/jquery-1.8.0.min.js"></script>
	<script src="js/modernizr-2.6.1.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/jquery.simplemodal-1.3.min.js"></script>
	<script>
	</script>
</head>

<body>

	<header>
		<%@include file="HeaderPanel.jsp"%>
	</header>
	
	<section id="tE-banner" class="">
		<img src="img/bannerInterior_ArmaTuEnsalada.jpg">
	</section>
	
	<section id="tE-content-bg" class="tE-content-bgUp">
		<div id="tE-main-content">
			<div class="tE-box-content">
				<div class="tE-box-left tE-box">
					<div id="tE-table-tabs" class="tE-tabs">
						<ul>
<%
for(int index = 0; index < productType.length ; index++)
{
	if (ArrayUtils.includes(selectedType, productType[index]))
	{
%>
							<li class="currentTab"><a href="#"><%= Constants.productTypeDescription(productType[index]) %></a></li>
<%
	}
	else
	{
%>
							<li><a onclick="openProcessingPopup()" href="SuggestionsView.jsp?productType=<%= ArrayUtils.toString(productType) %>&selectedType=<%= productType[index] %>"><%= Constants.productTypeDescription(productType[index]) %></a></li>
<%
	}
}
%>
						</ul>
					</div>
					
					<div class="tE-table" id="tE-product-table">
						<%@include file="MessagePanel.jsp"%>
<%
if (productList.size() == 0)
{
%>
						<div class="tE-row">
								<div class="tE-cellProduct tE-cell"><i>No hay elementos para mostrar</i></div>
						</div>
<%
}
else
{
	Iterator productIterator = productList.iterator();
	Product product = null;
	while (productIterator.hasNext())
	{
		product = (Product) productIterator.next();
%>
						<div class="tE-row">
							<div class="tE-cellProduct tE-cell">
								<%= product.getName() %></br><span><%= product.getDescription() %></span>
							</div>
							<div class="tE-cellPrice tE-cell">
								$&nbsp;<%= Constants.NUMBER_FORMAT.format(product.getPrice()) %>
							</div>
							<div class="tE-cellCheck tE-cell">
								<label>
									<a href="#" onclick="Salad_addProduct(<%= product.getId() %>); return false;">Agregar&nbsp;(+)</a>
								</label>
							</div>
						</div>
<%
		if (product.getChildren().size() > 0)
		{
%>
						<div id="Product_detail_<%=product.getId()%>"style="display: none">
<%
			Iterator productProductIterator = product.getChildren().iterator();
			ProductProduct productProduct = null;
			while (productProductIterator.hasNext())
			{
				productProduct = (ProductProduct) productProductIterator.next();
%>
							<div class="tE-cellProduct tE-cell"><%= productProduct.getChild().getName() %></div>
							<div class="tE-cellProduct tE-cell"><%= productProduct.getCount() %></div>
							<div class="tE-cellProduct tE-cell"><%= Constants.unitShortDescription(productProduct.getUnit()) %></div>
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
					<div class="tE-button-content">
<%
int index = 0;
for (; index < productType.length; index++)
{
	if (productType[index].intValue() == selectedType[0].intValue())
	{
		break;
	}
}

if (index > 0)
{
%>
						<input 
							class="tE-button-previous tE-button" 
							type="button" 
							onclick="openProcessingPopup(); document.location = 'SuggestionsView.jsp?productType=<%= ArrayUtils.toString(productType) %>&selectedType=<%= productType[index - 1] %>';" 
							value="Anterior"
							>
<%
}
%>
						<input 
							class="tE-button-up tE-button" 
							onclick="$('html, body').animate({ scrollTop: 0 }, 'slow');" 
							type="button" 
							value="Subir"
							>
<%
if (index < productType.length - 1)
{
%>
						<input 
							class="tE-button-next tE-button" 
							type="button" 
							onclick="openProcessingPopup(); document.location = 'SuggestionsView.jsp?productType=<%= ArrayUtils.toString(productType) %>&selectedType=<%= productType[index + 1] %>';" 
							value="Siguiente"
							>
<%
}
%>
					</div>
					
				</div>
				
				<div id="salad">
					<%@include file="Salad_render.jsp"%>
				</div>

			</div>
		</div>
	</section>
</body>

</html>
