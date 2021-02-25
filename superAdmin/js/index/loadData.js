
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
						"url": "php/index/showData.php"
					},

					"columns":[
						{"data":"nombreAdmin"},
						{"data":"empresa"},
						{"data":"correoContacto"},
						{"data":"telefonoContacto"},
						{"data":"statusClient"},
						{"data":"createData"},
						{"defaultContent": "<button type='button' class='detail btn btn-primary'><i class='fa fa-cogs'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

		view_detail("#bodegaData tbody", t);		
	}

	var view_detail = function(tbody, table){
		$(tbody).on("click", "button.detail", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var iduser = data.idadministrador;
			location.href="view_detail.php?administrador="+iduser;
		});
	}

	var obtener_id_eliminar = function(tbody, table){
		$(tbody).on("click", "button.eliminar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var iduser = $("#frmEliminar #iduser").val(data.idadministrador);
		});
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var nombreAdmin = $("#frmEditar #name").val(data.nombreAdmin);
			var empresa = $("#frmEditar #empresa").val( data.empresa );
			var correoContacto = $("#frmEditar #correoContacto").val( data.correoContacto );
			var telefonoContacto = $("#frmEditar #telefono").val( data.telefonoContacto );
			var password = $("#frmEditar #password").val( data.password );
			var iduser = $("#frmEditar #iduser").val( data.idadministrador );
		});
	}

	var eliminar = function(){
		$("#eliminar-usuario").on("click", function(){
			var iduser = $("#frmEliminar #iduser").val();
			$.ajax({
				method:"POST",
				url: "php/index/removeData.php",
				data: {
						"idadministrador": iduser
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
			var empresa = $("#frmEditar #empresa").val();
			var correoContacto = $("#frmEditar #correoContacto").val();
			var telefono = $("#frmEditar #telefono").val();
			var password = $("#frmEditar #password").val();
			var iduser = $("#frmEditar #iduser").val();

			$.ajax({
				method: "POST",
				url: "php/index/editData.php",
				data: {
					"name"   : name,
					"empresa"   : empresa,
					"correoContacto" : correoContacto,
					"telefono" : telefono,
					"password" : password,
					"idadministrador" : iduser
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

			var name = $("#frmAgregar #name").val();
			var empresa = $("#frmAgregar #empresa").val();
			var correoContacto = $("#frmAgregar #correoContacto").val();
			var telefono = $("#frmAgregar #telefono").val();
			var username = $("#frmAgregar #username").val();
			var password = $("#frmAgregar #password").val();
			var databasename = $("#frmAgregar #databasename").val();

			$.ajax({
				method: "POST",
				url: "php/index/addData.php",
				data: {
						"name"   : name,
						"empresa"   : empresa,
						"correoContacto" : correoContacto,
						"telefono" : telefono,
						"username": username,
						"password" : password,
						"databasename": databasename
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
