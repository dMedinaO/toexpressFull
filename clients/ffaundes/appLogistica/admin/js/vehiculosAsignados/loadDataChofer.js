$(document).ready(function () {

	$.ajax({
		type: "POST",
		url: "../php/vehiculosAsignados/showChoferes.php",
		success: function(response){
			$('.selector-chofer select').html(response).fadeIn();
		}
	});
});
