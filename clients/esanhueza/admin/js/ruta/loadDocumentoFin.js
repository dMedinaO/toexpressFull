$(window).on('load', function() {

	listar();

});
    // DATA TABLES
    // =================================================================
    // Require Data Tables
    // -----------------------------------------------------------------
    // http://www.datatables.net/
    // =================================================================

    $.fn.DataTable.ext.pager.numbers_length = 5;

    //listamos los datos...
		var listar = function(){
			var rutaID = getQuerystring('ruta');
	    var t = $('#rutaDetalle').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/ruta/documentosEnRutaFinalizada.php?ruta="+rutaID
					},

					"columns":[
						{"data":"folio"},
						{"data":"nombreCliente"},
						{"data":"receptor"},
						{"data":"estado"},
						{"data":"motivo"},
						{"defaultContent": "<button type='button' class='viewImage btn btn-success'><i class='fa fa-picture-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		viewImageButton("#rutaDetalle tbody", t);

	}

	var viewImageButton = function(tbody, table){
		$(tbody).on("click", "button.viewImage", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var path = data.path;
			location.href="../../imagenResource/"+path;
		});
	}

	var idioma_espanol = {
	    "sProcessing":     "Procesando...",
	    "sLengthMenu":     "Mostrar _MENU_ registros",
	    "sZeroRecords":    "No se encontraron resultados",
	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    "sInfoPostFix":    "",
	    "sSearch":         "Buscar:",
	    "sUrl":            "",
	    "sInfoThousands":  ",",
	    "sLoadingRecords": "Cargando...",
	    "oPaginate": {
	        "sFirst":    "Primero",
	        "sLast":     "Último",
	        "sNext":     "Siguiente",
	        "sPrevious": "Anterior"
	    },
	    "oAria": {
	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    }
	}

	//funcion para recuperar la clave del valor obtenido por paso de referencia
	function getQuerystring(key) {
		var url_string = window.location;
		var url = new URL(url_string);
		var c = url.searchParams.get(key);
		return c;
	};
