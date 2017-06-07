function openLogin()
{
	$('#LoginDialog').dialog();
}

function Cart_addProduct(product)
{
	Cart_addProduct(
			product, 
			function(){
				Cart_reload();
			}
		);
}

function Cart_addProduct(product, nextStep)
{
	$.ajax({
		url : 'Cart_addProduct.jsp?product=' + product + '&' + new Date().getTime(),
		success: nextStep
	});
}

function Cart_addPurchase(purchase)
{
	$.ajax({
		url : 'Cart_addPurchase.jsp?purchase=' + purchase + '&' + new Date().getTime(),
		success: function(data) 
		{
			Cart_updateLabel();
			document.location = "CartView.jsp";
		}
	});
}

function Cart_addGiftcard()
{
	var giftcard = $("#giftcard").val();
	if (giftcard == "")
	{
		return;
	}
	
	$.ajax({
		url: 'Cart_addGiftcard.jsp?giftcard=' + giftcard + '&' + new Date().getTime(),
		success: function(data) 
		{
			var response = eval(data);
			if (response.result < 0)
			{
				showError(response.message);
			}
			else
			{
				Cart_reload();
			}
		}
	});
}

function Cart_clear()
{
	$.ajax({
		url: 'Cart_clear.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			Cart_reload();
			$("#cartLabel").text("CARRITO");
		}
	});
}

function Cart_reload()
{
	Cart_updateLabel();
	$.ajax({
		url: 'CartPanel.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			$("#cartPanel").html(data);
		}
	});
}

function Cart_removeProduct(product)
{
	$.ajax({
		url: 'Cart_removeProduct.jsp?product=' + product + '&' + new Date().getTime(),
		success: function(data) 
		{
			Cart_reload();
		}
	});
}

function Cart_editProduct(product)
{
	$.ajax({
		url: 'Cart_editProduct.jsp?product=' + product + '&' + new Date().getTime(),
		success: function(data) 
		{
			document.location = "SaladCreate.jsp?" + new Date().getTime();
		}
	});
}

function Cart_removeGiftcard(giftcard)
{
	$.ajax({
		url: 'Cart_removeGiftcard.jsp?giftcard=' + giftcard + '&' + new Date().getTime(),
		success: function(data) 
		{
			Cart_reload();
		}
	});
}

function Cart_purchase()
{
	openProcessingPopup();
	document.location = 'Purchase.jsp';
}

function Cart_payCash()
{
	$.ajax({
		url: 'GetUser.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			Cart_reload();
		}
	});
}

function Product_toggle(product)
{
	$("#Product_detail_" + product).toggle('slow');
}

function Product_showCreate()
{
	$.ajax({
		url: 'Product_createForm.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			$("#Product_edit").html(data);
		}
	});
}

function Product_doCreate()
{
	$.post(
			'Product_doCreate.jsp', 
			$('#productForm').serialize(), 
			function(data){
				Product_edit(data);
			}
		);
}

function Product_edit(product)
{
	$.ajax({
		url: 'Product_edit.jsp?product=' + product + '&' + new Date().getTime(),
		success: function(data) 
		{
			$("#Product_edit").html(data);
		}
	});
}

function Product_update(product)
{
	$.post(
		'Product_update.jsp', 
		$('#productForm').serialize(), 
		function(data){
			Product_edit(product);
		}
	);
}

function Product_addProduct(product)
{
	$.post(
		'Product_addProduct.jsp', 
		$('#productForm').serialize(), 
		function(data){
			Product_edit(product);
		}
	);
}

function Product_removeProduct(product, child)
{
	$.ajax({
		url: 'Product_removeProduct.jsp?product=' + product + '&child=' + child + '&' + new Date().getTime(),
		success: function(data) 
		{
			Product_edit(product);
		}
	});
}

function Product_delete(product)
{
	$.ajax({
		url: 'Product_removeProduct.jsp?product=' + product + '&child=' + child + '&' + new Date().getTime(),
		success: function(data) 
		{
			Product_edit(product);
		}
	});
}

function Purchase_toggle(purchase)
{
	$("#Purchase_detail_" + purchase).toggle('slow');
}

function Salad_addProduct(product)
{
	$.ajax({
		url: 'Salad_addProduct.jsp?&product=' + product + '&' + new Date().getTime(),
		success: function(data) 
		{
			var response = eval(data);
			if (response.result < 0)
			{
				showError(response.message);
			}
			else
			{
				Salad_reload();
			}
		}
	});
}

function Salad_removeProduct(product)
{
	$.ajax({
		url: 'Salad_removeProduct.jsp?product=' + product + '&' + new Date().getTime(),
		success: function(data) 
		{
			Salad_reload();
		}
	});
}

function Salad_removeAbstractProduct(product, type)
{
	$.ajax({
		url: 'Salad_removeAbstractProduct.jsp?product=' + product + '&type=' + type + '&' + new Date().getTime(),
		success: function(data) 
		{
			Salad_reload();
		}
	});
}

function Salad_clear()
{
	$.ajax({
		url: 'Salad_clear.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			Salad_reload();
		}
	});
}

function Salad_reload()
{
	$.ajax({
		url: 'Salad_render.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			$("#salad").html(data);
			TuCuentaChanged();
		}
	});
}

function Salad_create()
{
	openProcessingPopup();
	
	var saladName = $("#saladName").val();
		
	$.ajax({
		url: 'Salad_create.jsp?saladName=' + saladName + '&' + new Date().getTime(),
		success: function(data) 
		{
			var response = eval(data);
			if (response.result < 0)
			{
				if (response.message)
				{
					showError(response.message);
				}
				else if (response.action)
				{
					eval(response.action);
				}
			}
			else
			{
				//Salad_reload();
				//Cart_updateLabel();
				document.location = "CartView.jsp";
			}
		}
	});
}

function Cart_updateLabel()
{
	$.ajax({
		url: 'Cart_getSize.jsp?' + new Date().getTime(),
		success: function(data) 
		{
			var result = eval(data);
			if (result.cartSize == 0)
			{
				$("#cartLabel").text("CARRITO");
			}
			else
			{
				$("#cartLabel").text("CARRITO (" + result.cartSize + ")");
			}
		}
	});
}

function doLogin()
{
	$.post(
		"Login_do.jsp", 
		$("#LoginForm"
		).serialize(), 
		function(data) {
			if (eval(data)) 
			{
				location.reload();
			}
			else
			{
				$("#password").val("");
			}
		});
}

function Purchase_addAddress()
{
	openProcessingPopup();

	var street = $("#street").val();
	if (street == "")
	{
		showError("'Calle' es requerida");
		return;
	}
	var number = $("#number").val();
	if (number == "")
	{
		showError("'N&uacute;mero' es requerido");
		return;
	}
	var floor  = $("#floor").val();
	var office = $("#office").val();
	
	$.ajax({
		url: "Purchase_addAddress.jsp?" + new Date().getTime(),
		data: { street: street, number: number, floor: floor, office: office },
		success: function(data) 
		{
			$("#Purchase_newAddress").before(data);
			$("#Purchase_newAddress").hide();
			$("#street").val("");
			$("#number").val("");
			$("#floor").val("");
			$("#office").val("");
			closeProcessingPopup();
		}
	});
}

function Purchase_validate()
{
	if ($("input[@name=address]:checked").length == 0)
	{
		showError("No te olvides de elegir tu direcci&oacute;n de env&iacute;o!");
		return false;	
	}
	
	return true;
}

function Purchase_addressSelected(address)
{
	$("#comment").val($("#addressComment_" + address).val());
}

function Purchase_doCashPayment()
{
	openProcessingPopup();
	if (!Purchase_validate())
	{
		return;
	}

	var address      = $("input[@name=address]:checked")[0].value;
	var deliveryTime = $("#deliveryTime").val();
	var comment      = $("#comment").val();
	
	$.ajax({
		url: "PurchaseCash.jsp?" + new Date().getTime(),
		data: { address: address, deliveryTime: deliveryTime, comment: comment },
		success: function(data) 
		{
			document.location = data;
		}
	});
}

function Purchase_doDineroMailPayment()
{
	if (!Purchase_validate())
	{
		return;
	}
	
	var address      = $("input[@name=address]:checked")[0].value;
	var deliveryTime = $("#deliveryTime").val();
	var comment      = $("#comment").val();
	
	$.ajax({
		url: "PurchaseDineroMail.jsp?" + new Date().getTime(),
		data: { address: address, deliveryTime: deliveryTime, comment: comment },
		success: function(data) 
		{
			document.location = data;
		}
	});
}

function Purchase_doDineroMailPayment()
{
	if (!Purchase_validate())
	{
		return;
	}
	
	var address      = $("input[@name=address]:checked")[0].value;
	var deliveryTime = $("#deliveryTime").val();
	var comment      = $("#comment").val();
	
	$.ajax({
		url: "PurchaseDineroMail.jsp?" + new Date().getTime(),
		data: { address: address, deliveryTime: deliveryTime, comment: comment },
		success: function(data) 
		{
			document.location = data;
		}
	});
}

function Purchase_doDineroMailPayment()
{
	if (!Purchase_validate())
	{
		return;
	}
	
	var address      = $("input[@name=address]:checked")[0].value;
	var deliveryTime = $("#deliveryTime").val();
	var comment      = $("#comment").val();
	
	$.ajax({
		url: "PurchaseDineroMail.jsp?" + new Date().getTime(),
		data: { address: address, deliveryTime: deliveryTime, comment: comment },
		success: function(data) 
		{
			$("#DineroMailPanel").html(data);
			$("#DineroMailPanel form").submit();
		}
	});
}

function Home_quiero(product)
{
	Cart_addProduct(
			product, 
			function(){
				document.location = "CartView.jsp?" + new Date().getTime();
				}
			);
}

function showInfo(message)
{
	closeProcessingPopup();
	$("#popup .message .content").html(message);
	openPopup();
}

function showWarn(warn)
{
	closeProcessingPopup();
	$("#popup .message .content").html(warn);
	openPopup();
}

function showError(error)
{
	closeProcessingPopup();
	$("#popup .message .content").html(error);
	openPopup();
}

function TuCuentaChanged()
{
	//playSound();
	//TuCuentaRotate();
	//TuCuentaShine();
	//TuCuentaMove();
	$(".tE-white-box").effect("highlight", {color:"#8DAF21"}, 500);
}

function TuCuentaShine()
{
	var time = 100;
	var times = 4;
	for (var index = 0; index < times; index++)
	{
		setTimeout(
				function() {
					$(".tE-white-box").addClass("TuCuentaChanged");
					}, 
					time * index
				);
		index++;
		setTimeout(
				function() {
					$(".tE-white-box").removeClass("TuCuentaChanged");
					}, 
					time * index
				);				
	}
}

function TuCuentaRotate()
{
	var message = $('#cuenta').html();
	for (var index = 0; index <= message.length; index++)
	{
		setTimeout(
				function() {
					$('#cuenta').html(message);
					//message = message.substring(1) + message.charAt(0);
					message = message.charAt(message.length - 1) + message.substring(0, message.length - 1);
					}, 
					150 * index
				);				
	}
}

function TuCuentaMove()
{
	var time = 50;
	var times = 1;
	var jumps = new Array("-50px", "-60px", "-50px", "-40px", "-30px", "-40px");
	var jumpIndex = 0;
	for (var index = 0; index < times; index++)
	{
		for (var timeIndex = 0; timeIndex < jumps.length; timeIndex++)
		{
			setTimeout(
					function() {
						$(".tE-right-boxes-container").css("top", jumps[jumpIndex % jumps.length]);
						//$(".tE-right-boxes-container").css("padding-left", "5px");
						jumpIndex++;
						}, 
						(time * (index + 1) * (timeIndex + 1)) - time
					);
		}
	}
}

function playSound(){
	$('embed').remove();
	$('body').append('<embed src="sounds/cash-register.wav" autostart="true" hidden="true" loop="false">');
}

function openPopup()
{
	document.location = "#";
	$("#popup").css("height", document.height);
	$("#popup").show();	
}

function closePopup(popup)
{
	$("#popup").hide();	
}

function openGiftcardPopup()
{
	$("#giftcard").val("");
	document.location = "#";
	$("#GiftcardPopup").css("height", document.height);
	$("#GiftcardPopup").show();	
}

function closeGiftcardPopup()
{
	$("#GiftcardPopup").hide();
}

function openProcessingPopup()
{
	document.location = "#";
	$("#processing").css("height", document.height);
	$("#processing").show();	
}

function closeProcessingPopup()
{
	$("#processing").hide();
}

function openClosedPopup()
{
	document.location = "#";
	$("#closed").css("height", document.height);
	$("#closed").show();	
}

function closeClosedPopup()
{
	$("#closed").hide();
}
