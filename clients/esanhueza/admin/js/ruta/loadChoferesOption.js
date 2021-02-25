$(document).ready(function () {

	$.ajax({
		type: "POST",
		url: "../php/ruta/showChofer.php",
		success: function(response){
			$('.selector-chofer select').html(response).fadeIn();
		}
	});
});
