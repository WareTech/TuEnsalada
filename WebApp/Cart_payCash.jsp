<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.PurchaseUtil"%>
<%@page import="com.sun.rsasign.o"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.PurchaseItem"%>
<%@page import="ar.com.WareTech.TuEnsalada.Constants"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<%@page import="java.util.Date"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Purchase"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Product"%>
<%@page import="java.util.Iterator"%>
<%@page import="ar.com.WareTech.TuEnsalada.backend.Database"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.services.WebUtils"%>
<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Cart"%>
<%
Cart cart =  WebUtils.getCart(request);

Purchase purchase = new Purchase();
purchase.setCreated(new Date());
purchase.setStatus(Constants.PURCHASE_STATUS_PREPEARING);
purchase.setCustomer(WebUtils.getUser(request));
purchase.setPaymentType(Constants.PAYMEMNT_TYPE_CASH);
purchase.setTotal(cart.getTotal());
Database.getCurrentSession().save(purchase);

Iterator productIterator = cart.getProducts().iterator();
Product product;
PurchaseItem purchaseItem;
while(productIterator.hasNext())
{
	product = (Product) productIterator.next();
	purchaseItem = new PurchaseItem();
	purchaseItem.setPurchase(purchase);
	purchaseItem.setProduct(product);
	purchaseItem.setCount(cart.getProductCount(product));
	purchaseItem.setDescription(PurchaseUtil.toString(product));
	purchaseItem.setPosition(new Integer(cart.getProducts().indexOf(product) + 1));
	purchaseItem.setPrice(product.getPrice());
	Database.getCurrentSession().save(purchaseItem);
}
%>