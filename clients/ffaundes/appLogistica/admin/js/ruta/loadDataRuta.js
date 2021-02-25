$(window).on('load', function() {

	listar();
	listarPendiente();
	listarFinalizadas();
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
	    var t1 = $('#rutaData').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/ruta/showData.php"
					},

					"columns":[
						{"data":"nombreRuta"},
						{"data":"jornadaRuta"},
						{"data":"fecha"},
						{"data":"modifiedRuta"},
						{"data":"rutChofer"},
						{"defaultContent": "<button type='button' class='detalle btn btn-success'><i class='fa fa-file'></i></button> <button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>	<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		obtener_id_eliminar("#rutaData tbody", t1);
		obtener_data_editar("#rutaData tbody", t1);
		detalleRuta("#rutaData tbody", t1);
	}

	//listamos las pendientes
	var listarPendiente = function(){
		var t2 = $('#rutaDataPendiente').DataTable({
				"responsive": true,
				"language": idioma_espanol,
				"dom": '<"newtoolbar">frtip',

				"destroy":true,
				"ajax":{
					"method":"POST",
					"url": "../php/ruta/showDataPendiente.php"
				},

				"columns":[
					{"data":"nombreRuta"},
					{"data":"jornadaRuta"},
					{"data":"fecha"},
					{"data":"modifiedRuta"},
					{"data":"rutChofer"},
					{"defaultContent": "<button type='button' class='detalle btn btn-success'><i class='fa fa-file'></i></button> <button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>"}
				]
		});
		$('#demo-custom-toolbar3').appendTo($("div.newtoolbar"));

		obtener_data_editar("#rutaDataPendiente tbody", t2);
		detalleRuta("#rutaDataPendiente tbody", t2);
	}

	//listamos las pendientes
	var listarFinalizadas = function(){
		var t3 = $('#rutaDataFinalizada').DataTable({
				"responsive": true,
				"language": idioma_espanol,
				"dom": '<"newtoolbar">frtip',

				"destroy":true,
				"ajax":{
					"method":"POST",
					"url": "../php/ruta/showDataFinalizada.php"
				},

				"columns":[
					{"data":"nombreRuta"},
					{"data":"jornadaRuta"},
					{"data":"fecha"},
					{"data":"modifiedRuta"},
					{"data":"rutChofer"},
					{"defaultContent": "<button type='button' class='detalle btn btn-success'><i class='fa fa-file'></i></button> <button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>"}
				]
		});
		$('#demo-custom-toolbar4').appendTo($("div.newtoolbar"));

		obtener_data_editar("#rutaDataFinalizada tbody", t3);
		detalleRuta("#rutaDataFinalizada tbody", t3);
	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var idrutas = $("#frmEliminar #idrutas").val( data.idrutas );
		});
	}

	var detalleRuta = function(tbody, table){
		$(tbody).on("click", "button.detalle", function(){
			var data = table.row( $(this).parents("tr") ).data();

			var estado = data.estado;
			if (estado == "INICIADO"){
				location.href="viewDetail.php?ruta="+data.idrutas;
			}

			if (estado == "EN PROCESO"){
				location.href="viewDetailPendiente.php?ruta="+data.idrutas;
			}

			if (estado == "TERMINADO"){
				location.href="viewDetailFinalizada.php?ruta="+data.idrutas;
			}

		});
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var name = $("#frmEditar #name").val(data.nombreRuta);
			var idrutas = $("#frmEditar #idrutas").val(data.idrutas);
		});
	}

	var eliminar = function(){
		$("#eliminar-ruta").on("click", function(){
			var idrutas = $("#frmEliminar #idrutas").val();
			$.ajax({
				method:"POST",
				url: "../php/ruta/removeData.php",
				data: {
						"idrutas": idrutas
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

			var name = $("#frmEditar #name").val();
			var idrutas = $("#frmEditar #idrutas").val();
			var jornada = $("#frmEditar #jornada").val();
			var estado = $("#frmEditar #estado").val();

			$.ajax({
				method: "POST",
				url: "../php/ruta/editData.php",
				data: {
					"name"   : name,
					"idrutas"   : idrutas,
					"jornada" : jornada,
					"estado" : estado
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
