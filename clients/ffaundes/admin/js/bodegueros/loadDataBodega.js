$(document).ready(function () {

	$.ajax({
		type: "POST",
		url: "../php/bodega/showBodegas.php",
		success: function(response){
			$('.selector-bodega select').html(response).fadeIn();
		}
	});
});
