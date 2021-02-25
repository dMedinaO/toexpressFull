$(window).on('load', function() {

	listar();
	guardar();
	eliminar();
	editar();
	guardarMasivo();

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
						"url": "../php/ruta/documentosEnRuta.php?ruta="+rutaID
					},

					"columns":[
						{"data":"nombreCliente"},
						{"data":"rutCliente"},
						{"data":"tipoDocumento"},
						{"data":"folio"},
						{"data":"fechaEmision"},
						{"data":"monto"},
						{"defaultContent": "<button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>	<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		obtener_id_eliminar("#rutaDetalle tbody", t);
		obtener_data_editar("#rutaDetalle tbody", t);

	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var iddocumento = $("#frmEliminar #iddocumento").val( data.iddocumento );
		});
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var folio = $("#frmEditar #folio").val(data.folio);
			var fechaEmision = $("#frmEditar #fechaEmision").val(data.fechaEmision);
			var monto = $("#frmEditar #monto").val(data.monto);
			var iddocumento = $("#frmEditar #iddocumento").val(data.iddocumento);

		});
	}

	var eliminar = function(){
		$("#eliminar-documento").on("click", function(){
			var iddocumento = $("#frmEliminar #iddocumento").val();
			$.ajax({
				method:"POST",
				url: "../php/ruta/removeDocumento.php",
				data: {
						"iddocumento": iddocumento
					  }
			}).done( function( info ){
				var json_info = JSON.parse( info );
				mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var editar = function(){
		$("#editar-documento").on("click", function(){

			var folio = $("#frmEditar #folio").val();
			var fechaEmision = $("#frmEditar #fechaEmision").val();
			var monto = $("#frmEditar #monto").val();
			var iddocumento = $("#frmEditar #iddocumento").val();

			$.ajax({
				method: "POST",
				url: "../php/ruta/editDocumento.php",
				data: {
					"folio"   : folio,
					"fechaEmision"   : fechaEmision,
					"monto" : monto,
					"iddocumento" : iddocumento

				}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var guardar = function(){
		$("#agregar-documento").on("click", function(){

			var folio = $("#frmAgregar #folio").val();
			var fechaEmision = $("#frmAgregar #fechaEmision").val();
			var rut = $("#frmAgregar #rut").val();
			var monto = $("#frmAgregar #monto").val();
			var tipoDoc = $("#frmAgregar #tipoDoc").val();
			var ruta = getQuerystring('ruta');

			$.ajax({
				method: "POST",
				url: "../php/ruta/addData.php",
				data: {
						"folio"   : folio,
						"fechaEmision"   : fechaEmision,
						"rut"   : rut,
						"monto"   : monto,
						"tipoDoc" : tipoDoc,
						"ruta" : ruta
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				console.log(json_info);
				//mostrar_mensaje( json_info );
				//location.reload(true);
			});
		});
	}

	var guardarMasivo = function(){
		$("#agregar-masiva").on("click", function(){
			$('#loading').show();
			var ruta = getQuerystring('ruta');

			$.ajax({
				method: "POST",
				url: "../php/ruta/addDataMasiva.php",
				data: {
						"ruta" : ruta
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				console.log(json_info);
				if (json_info.process="OK"){
					$('#loading').hide();
					$('#okResponse').show();
					setTimeout("location.href=''", 5000);

				}else{
					$('#loading').hide();
					$('#errorResponse').show();
					setTimeout("location.href=''", 5000);
				}
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

	//funcion para recuperar la clave del valor obtenido por paso de referencia
	function getQuerystring(key) {
		var url_string = window.location;
		var url = new URL(url_string);
		var c = url.searchParams.get(key);
		return c;
	};
