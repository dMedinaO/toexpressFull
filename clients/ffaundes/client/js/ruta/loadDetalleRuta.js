$(window).on('load', function() {

	listarData();

});

function listarData() {

	var ruta = getQuerystring('ruta');
	$.ajax({
		method: "POST",
		url: "../php/ruta/showDetalle.php",
		data: {
			"ruta"   : ruta
		}

	}).done( function( info ){

		var json_info = JSON.parse( info );
		if (json_info.exec= "OK"){

				$(".name").html(json_info.name);
				$(".Fecha").html(json_info.fecha);
				$(".estado").html(json_info.estado);
				$(".chofer").html(json_info.chofer);
		}
	});

}

//funcion para recuperar la clave del valor obtenido por paso de referencia
function getQuerystring(key) {
	var url_string = window.location;
	var url = new URL(url_string);
	var c = url.searchParams.get(key);
	return c;
};
