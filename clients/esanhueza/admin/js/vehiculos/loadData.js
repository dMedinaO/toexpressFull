
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
	editar();

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
						"url": "../php/vehiculos/showData.php"
					},

					"columns":[
						{"data":"patente"},
						{"data":"marca"},
						{"data":"modelo"},
						{"data":"anoVehiculo"},
						{"data":"createdVehiculo"},
						{"data":"modifiedVehiculo"},
						{"defaultContent": "<button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>	<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		obtener_id_eliminar("#bodegaData tbody", t);
		obtener_data_editar("#bodegaData tbody", t);
	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var iduser = $("#frmEliminar #iduser").val(data.patente);
		});
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var patente = $("#frmEditar #patente").val(data.patente);
			var marca = $("#frmEditar #marca").val( data.marca );
			var modelo = $("#frmEditar #modelo").val( data.modelo );
			var ano = $("#frmEditar #ano").val( data.anoVehiculo );
			var idbodega = $("#frmEditar #iduser").val(data.patente);
		});
	}

	var eliminar = function(){
		$("#eliminar-usuario").on("click", function(){
			var iduser = $("#frmEliminar #iduser").val();
			$.ajax({
				method:"POST",
				url: "../php/vehiculos/removeData.php",
				data: {
						"iduser": iduser
					  }
			}).done( function( info ){
				var json_info = JSON.parse( info );
				mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var editar = function(){
		$("#editar-usuario").on("click", function(){

			var patente = $("#frmEditar #patente").val();
			var marca = $("#frmEditar #marca").val();
			var modelo = $("#frmEditar #modelo").val();
			var ano = $("#frmEditar #ano").val();
			var patenteOld = $("#frmEditar #iduser").val();

			$.ajax({
				method: "POST",
				url: "../php/vehiculos/editData.php",
				data: {
					"patente"   : patente,
					"modelo"   : modelo,
					"marca"   : marca,
					"ano" : ano,
					"patenteOld" : patenteOld,
				}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var guardar = function(){
		$("#agregar-bodega").on("click", function(){

			var patente = $("#frmAgregar #patente").val().toUpperCase();
			var marca = $("#frmAgregar #marca").val().toUpperCase();
			var modelo = $("#frmAgregar #modelo").val().toUpperCase();
			var ano = $("#frmAgregar #ano").val().toUpperCase();

			$.ajax({
				method: "POST",
				url: "../php/vehiculos/addData.php",
				data: {
						"patente"   : patente,
						"modelo"   : modelo,
						"marca"   : marca,
						"ano" : ano
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var mostrar_mensaje = function( informacion ){

		var texto = "", color = "";
		if( informacion.respuesta == "BIEN" ){
			texto = "<strong>Bien!</strong> Se han guardado los cambios correctamente.";
			color = "#379911";
		}else if( informacion.respuesta == "ERROR"){
			texto = "<strong>Error</strong>, no se ejecutó la consulta.";
			color = "#C9302C";
		}else if( informacion.respuesta == "EXISTE" ){
			texto = "<strong>Información!</strong> el usuario ya existe.";
			color = "#5b94c5";
		}else if( informacion.respuesta == "VACIO" ){
			texto = "<strong>Advertencia!</strong> debe llenar todos los campos solicitados.";
			color = "#ddb11d";
		}else if( informacion.respuesta == "OPCION_VACIA" ){
			texto = "<strong>Advertencia!</strong> la opción no existe o esta vacia, recargar la página.";
			color = "#ddb11d";
		}

		$(".mensaje").html( texto ).css({"color": color });
		$(".mensaje").fadeOut(5000, function(){
			$(this).html("");
			$(this).fadeIn(3000);
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
