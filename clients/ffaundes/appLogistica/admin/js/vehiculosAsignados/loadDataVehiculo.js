$(document).ready(function () {

	$.ajax({
		type: "POST",
		url: "../php/vehiculosAsignados/showVehiculos.php",
		success: function(response){
			$('.selector-vehiculo select').html(response).fadeIn();
		}
	});
});
