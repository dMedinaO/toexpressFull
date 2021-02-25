$(document).ready(function () {

	$.ajax({
		type: "POST",
		url: "../php/choferes/showVehiculos.php",
		success: function(response){
			$('.selector-vehiculo select').html(response).fadeIn();
		}
	});
});
