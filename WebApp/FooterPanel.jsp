<%@page import="ar.com.WareTech.TuEnsalada.middleware.entities.Configuration"%>
<div class="tE-footer-content tE-box-content">
	<div class="tE-box">
		<h5>Info</h5>
		<p>
		<a href="mailto:<%= Configuration.getString("mailto", "-") %>"><%= Configuration.getString("mailto", "") %></a></br>
		<%= Configuration.getString("telefono", "-") %>
		</br></br>
		Oficinas comerciales:</br>
		<%= Configuration.getString("direccion", "-") %></br>
		<%= Configuration.getString("ciudad", "-") %></br></br>
		Tu Ensalada </br>
		Copyright 2012
		</p>
	</div>
	<div class="middle tE-box">
		<h5>Lo &uacute;ltimo en <a href="http://www.facebook.com/TuEnsaladaComAr">Facebook</a></h5>
		<p>
		<%= Configuration.getString("lo ultimo en facebook (tiempo)", "-") %></br>
		<div class="dotted"><img src="img/bt-facebook.png"></div>
		</p>
		<p><%= Configuration.getString("lo ultimo en facebook", "-") %>
		</p>
		</br></br>
		<h5>Lo &uacute;ltimo en <a href="http://twitter.com/TuEnsalada">Twitter</a></h5>
		<p>
		<%= Configuration.getString("lo ultimo en twitter (tiempo)", "-") %></br>
		<div class="dotted"><img src="img/bt-twitter.png"></div>
		</p>
		<p><%= Configuration.getString("lo ultimo en twitter", "-") %>
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
