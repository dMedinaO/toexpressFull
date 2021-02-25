
// Tables-DataTables.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(window).on('load', function() {

	listar();
	guardar();
	eliminar();

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
	    var t = $('#bodegaData').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/vehiculosAsignados/showData.php"
					},

					"columns":[
						{"data":"chofer_rutChofer"},
						{"data":"vehiculo_patente"},
						{"data":"fechaAsignacion"},
						{"defaultContent": "<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		obtener_id_eliminar("#bodegaData tbody", t);

	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var chofer = $("#frmEliminar #chofer").val( data.chofer_rutChofer );
			var vehiculo = $("#frmEliminar #vehiculo").val( data.vehiculo_patente );
		});
	}

	var eliminar = function(){
		$("#eliminar-usuario").on("click", function(){
			var chofer = $("#frmEliminar #chofer").val();
			var vehiculo = $("#frmEliminar #vehiculo").val();

			$.ajax({
				method:"POST",
				url: "../php/vehiculosAsignados/removeData.php",
				data: {
						"chofer": chofer,
						"vehiculo": vehiculo
				}
			}).done( function( info ){
				var json_info = JSON.parse( info );
				//mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var guardar = function(){
		$("#asignar").on("click", function(){

			var chofer = $("#frmAgregar #chofer").val();
			var vehiculo = $("#frmAgregar #vehiculo").val();

			$.ajax({
				method: "POST",
				url: "../php/vehiculosAsignados/addData.php",
				data: {
						"chofer"   : chofer,
						"vehiculo"   : vehiculo
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				console.log(json_info);
				//mostrar_mensaje( json_info );
				location.reload(true);
			});
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
