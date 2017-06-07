<html>
	<body>
<script>
function add()
{
	$.ajax({
		url: 'https://argentina.dineromail.com/Carrito/cart.asp?NombreItem=Prueba+%23003&amp;TipoMoneda=1&amp;PrecioItem=175%2E00&amp;NroItem=PRUEBA003&amp;image_url=https%3A%2F%2Fwww%2Egoogle%2Ecom%2Ear%2Flogos%2F2012%2Fmontessori%2Dhp%2Ejpg&amp;DireccionExito=http%3A%2F%2F&amp;DireccionFracaso=http%3A%2F%2F&amp;DireccionEnvio=1&amp;Mensaje=1&amp;MediosPago=4%2C5%2C6%2C14%2C15%2C16%2C17%2C18%2C7%2C13&amp;Comercio=1012746',
		success: function(data) 
		{
			alert(data);
		}
	});
}
</script>	
		<table>
			<tr>
				<td>Agregar al Carrito</td>
				<td><a href="#" onclick="window.open('https://argentina.dineromail.com/Carrito/cart.asp?NombreItem=Prueba+%23001&amp;TipoMoneda=1&amp;PrecioItem=50%2E00&amp;NroItem=PRUEBA001&amp;image_url=https%3A%2F%2Fwww%2Egoogle%2Ecom%2Ear%2Flogos%2F2012%2Fmontessori%2Dhp%2Ejpg&amp;DireccionExito=http%3A%2F%2F&amp;DireccionFracaso=http%3A%2F%2F&amp;DireccionEnvio=1&amp;Mensaje=1&amp;MediosPago=4%2C5%2C6%2C14%2C15%2C16%2C17%2C18%2C7%2C13&amp;Comercio=1012746','Carrito','width=600,height=275,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes,directories=no');"><img src="https://argentina.dineromail.com/imagenes/botones/agregar_c.gif" border="0"></a></td>
			</tr>
			<tr>
				<td>Agregar al Carrito</td>
				<td><input name="add" id="add" type="button" value="Add" onclick="add();" /></td>
			</tr>
			<tr>
				<td>Ver el Carrito</td>
				<td><a href="#" onclick="window.open('https://argentina.dineromail.com/Carrito/cart.asp?Comercio=1012746','Carrito','width=600,height=275,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=no,directories=no');"><img src="https://argentina.dineromail.com/imagenes/botones/ver_c.gif" border="0"></a></td>
			</tr>
			<tr>
				<td>Pagar</td>
				<td>
					<form action='https://argentina.dineromail.com/Shop/Shop_Ingreso.asp' method='post'> 
						<input type='hidden' name='NombreItem' value='Prod1, Prod2, Prod3, Prod4'> 
						<input type='hidden' name='TipoMoneda' value='1'> 
						<input type='hidden' name='PrecioItem' value='135'> 
						<input type='hidden' name='E_Comercio' value='1012746'> 
						<input type='hidden' name='NroItem' value='CVD22'> 
						<input type='hidden' name='image_url' value='https://www.comercio.com/imagen.gif'> 
						<input type='hidden' name='DireccionExito' value='http://www.exito.com'> 
						<input type='hidden' name='DireccionFracaso' value='http://www.fracaso.com'> 
						<input type='hidden' name='DireccionEnvio' value='1'> 
						<input type='hidden' name='Mensaje' value='1'> 
						<input type='image' src='https://argentina.dineromail.com/imagenes/vender/boton/comprar-gris.gif' border='0' name='submit' alt='Pagar con Dineromail'> 
					</form>
				</td>			
			</tr>
			<tr>
				<td>Consumos</td>
				<td><a href="https://argentina.dineromail.com/vender/ConsultaPago.asp?Email=augustosoncini@hotmail.com&Acount=1012746&Pin=5Y60Y7A7TQ&StartDate=20120101&EndDate=20121231&XML=1">Ver</a></td>
			</tr>
			<tr>
				<td>Agregar al Carrito</td>
				<td><a href="#" onclick="window.open('https://argentina.dineromail.com/Carrito/cart.asp?NombreItem=LOBO&amp;TipoMoneda=1&amp;PrecioItem=125%2E50&amp;NroItem=Carrito+%231&amp;image_url=https%3A%2F%2F&amp;DireccionExito=http%3A%2F%2F&amp;DireccionFracaso=http%3A%2F%2F&amp;DireccionEnvio=1&amp;Mensaje=1&amp;MediosPago=4%2C5%2C6%2C14%2C15%2C16%2C17%2C18%2C7%2C13&amp;Comercio=1012746','Carrito','width=600,height=275,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes,directories=no');"><img src="https://argentina.dineromail.com/imagenes/botones/agregar_c.gif" border="0"></a></td>
			</tr>
			<tr>
				<td>Ver el Carrito</td>
				<td><a href="#" onclick="window.open('https://argentina.dineromail.com/Carrito/cart.asp?Comercio=1012746','Carrito','width=600,height=275,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=no,directories=no');"><img src="https://argentina.dineromail.com/imagenes/botones/ver_c.gif" border="0"></a></td>
			</tr>
		</table>
	</body>
</html>
