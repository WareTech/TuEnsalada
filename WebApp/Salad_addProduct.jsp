<%@page import="ar.com.WareTech.TuEnsalada.backend.Logger"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.ProductProduct"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.*"%>
<%
JSONObject jsonObject = new JSONObject();

String productId = request.getParameter("product");
if (productId == null)
{
	jsonObject.put("result", "-1");
	jsonObject.put("message", "Debe seleccionar un Producto");
	out.print("(");
	out.print(jsonObject.toJSONString());
	out.print(")");
	return;
}

if ("".equals(productId))
{
	jsonObject.put("result", "-1");
	jsonObject.put("message", "Debe seleccionar un Producto");
	out.print("(");
	out.print(jsonObject.toJSONString());
	out.print(")");
	return;
}

Product product = WebUtils.getProduct(request);
ProductProduct productProduct = product.getChild(new Long(productId));

if (productProduct == null)
{
	Product child = (Product) Database.getCurrentSession().get(Product.class, new Long(productId));

	if (product.ingredientCount() >= 6 && child.isIngredient())
	{
		jsonObject.put("result", "-1");
		jsonObject.put("message", "Debe seleccionar exactamente 6 ingredientes");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	
	// ----------------------------------------------------------------------------------------------------------------
	String menuProduct = (String) product.getAbstractParamaterMap().get(child.getType().toString());
	if (menuProduct != null)
	{
		product.getAbstractParamaterMap().remove(child.getType().toString());
		product.getAbstractParamaterMap().put(
				menuProduct + "_" + child.getType(), 
				child
				);
		
		jsonObject.put("result", "1");
		out.print("(");
		out.print(jsonObject.toJSONString());
		out.print(")");
		return;
	}
	// ----------------------------------------------------------------------------------------------------------------
	
	productProduct = new ProductProduct();
	productProduct.setChild(child);
	productProduct.setParent(product);
	productProduct.setCount(new Integer(1));
	productProduct.setUnit(Constants.UNIT_UNIT);
	product.getChildren().add(productProduct);
	
	if (child.isMenu())
	{
		Iterator menuProductProductIterator = child.getChildren().iterator();
		ProductProduct menuProductProduct;
		while(menuProductProductIterator.hasNext())
		{
			menuProductProduct = (ProductProduct) menuProductProductIterator.next();
			if (menuProductProduct.getChild().isAbstract())
			{
				product.getAbstractParamaterMap().put(
						menuProductProduct.getChild().getType().toString(), 
						child.getId().toString()
						);
			}
		}
	}
}
else if (product.ingredientCount() >= 6 && productProduct.getChild().isIngredient())
{
	jsonObject.put("result", "-1");
	jsonObject.put("message", "Debe seleccionar exactamente 6 ingredientes");
	out.print("(");
	out.print(jsonObject.toJSONString());
	out.print(")");
	return;
}
else
{
	productProduct.setCount(new Integer(productProduct.getCount().intValue() + 1));
}
product.calculatePrice();

jsonObject.put("result", "1");
out.print("(");
out.print(jsonObject.toJSONString());
out.print(")");
%>