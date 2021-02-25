
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

//funcion para recuperar la clave del valor obtenido por paso de referencia
function getQuerystring(key, default_) {
	if (default_ == null)
		default_ = "";
	key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regex = new RegExp("[\\?&amp;]"+key+"=([^&amp;#]*)");
	var qs = regex.exec(window.location.href);
	if(qs == null)
		return default_;
	else
		return qs[1];
};

    // DATA TABLES
    // =================================================================
    // Require Data Tables
    // -----------------------------------------------------------------
    // http://www.datatables.net/
    // =================================================================

    $.fn.DataTable.ext.pager.numbers_length = 5;

    //listamos los datos...
		var listar = function(){
			var sucursal = getQuerystring('sucursal');
	    var t = $('#bodegaData').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/recepcionista/showData.php?sucursal="+sucursal
					},

					"columns":[
						{"data":"idreceptoresProducto"},
						{"data":"nombreReceptor"},
						{"data":"cargo"},
						{"data":"nameUser"},
						{"data":"numberDevice"},
						{"data":"email"},
						{"data":"createdReceptor"},
						{"data":"modifiedReceptor"},
						{"defaultContent": " <button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>	<button type='button' class='eliminar btn btn-danger' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		obtener_id_eliminar("#bodegaData tbody", t);
		obtener_data_editar("#bodegaData tbody", t);

	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var iduser = $("#frmEliminar #iduser").val( data.idreceptoresProducto );
		});
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var name = $("#frmEditar #name").val(data.nombreReceptor);
			var username = $("#frmEditar #username").val(data.nameUser);
			var cargo = $("#frmEditar #cargo").val(data.cargo);
			var rut = $("#frmEditar #rut").val(data.idreceptoresProducto);
			var phone = $("#frmEditar #phone").val(data.numberDevice);
			var email = $("#frmEditar #email").val(data.email);
			var oldRut = $("#frmEditar #oldRut").val(data.idreceptoresProducto);
		});
	}

	var eliminar = function(){
		$("#eliminar-usuario").on("click", function(){
			var iduser = $("#frmEliminar #iduser").val();
			$.ajax({
				method:"POST",
				url: "../php/recepcionista/removeData.php",
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

			var name = $("#frmEditar #name").val();
			var username = $("#frmEditar #username").val();
			var cargo = $("#frmEditar #cargo").val();
			var rut = $("#frmEditar #rut").val();
			var phone = $("#frmEditar #phone").val();
			var email = $("#frmEditar #email").val();
			var oldRut = $("#frmEditar #oldRut").val();

			$.ajax({
				method: "POST",
				url: "../php/recepcionista/editData.php",
				data: {
					"name"   : name,
					"rut"   : rut,
					"oldRut": oldRut,
					"phone": phone,
					"email": email,
					"username": username,
					"cargo": cargo
				}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				//mostrar_mensaje( json_info );
				location.reload(true);
			});
		});
	}

	var guardar = function(){
		$("#agregar-bodega").on("click", function(){

			var name = $("#frmAgregar #name").val();
			var rut = $("#frmAgregar #rut").val();
			var phone = $("#frmAgregar #phone").val();
			var email = $("#frmAgregar #email").val();
			var username = $("#frmAgregar #username").val();
			var cargo = $("#frmAgregar #cargo").val();
			var sucursal = getQuerystring('sucursal');
			var client = getQuerystring('client');

			$.ajax({
				method: "POST",
				url: "../php/recepcionista/addData.php",
				data: {
						"name"   : name,
						"rut"   : rut,
						"phone"   : phone,
						"email"   : email,
						"username"   : username,
						"cargo"   : cargo,
						"sucursal" : sucursal,
						"client" : client

					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				console.log(json_info);
				//mostrar_mensaje( json_info );
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
