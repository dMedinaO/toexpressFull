// Tables-DataTables.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(window).on('load', function() {

	listar_contacto();
	listar_usuario();
	editar_contacto();
	editar_usuario_info();

});
    // DATA TABLES
    // =================================================================
    // Require Data Tables
    // -----------------------------------------------------------------
    // http://www.datatables.net/
    // =================================================================

    $.fn.DataTable.ext.pager.numbers_length = 5;

    //listamos los datos...
	var listar_contacto = function(){
		var id_administrador = getQuerystring('administrador');		
	    var t = $('#info_contacto').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "php/details/showData.php?id_data="+id_administrador
					},

					"columns":[
						{"data":"nombreAdmin"},
						{"data":"empresa"},
						{"data":"correoContacto"},
						{"data":"telefonoContacto"},
						{"data":"statusClient"},						
						{"defaultContent": "<button type='button' class='editar_contacto btn btn-primary' data-toggle='modal' data-target='#myModalEditar_contacto'><i class='fa fa-pencil-square-o'></i></button>"}
					]
	    });
	    
	    obtener_data_editar_contacto("#info_contacto tbody", t);
	}

	var obtener_data_editar_contacto = function(tbody, table){
		$(tbody).on("click", "button.editar_contacto", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var nombreAdmin = $("#frmEditar_contacto #name").val(data.nombreAdmin);
			var empresa = $("#frmEditar_contacto #empresa").val( data.empresa );
			var correoContacto = $("#frmEditar_contacto #correoContacto").val( data.correoContacto );
			var telefonoContacto = $("#frmEditar_contacto #telefono").val( data.telefonoContacto );
		});
	}

	var editar_contacto = function(){
		$("#editar-contacto").on("click", function(){

			var id_administrador = getQuerystring('administrador');
			var nombreAdmin = $("#frmEditar_contacto #name").val();
			var empresa = $("#frmEditar_contacto #empresa").val();
			var correoContacto = $("#frmEditar_contacto #correoContacto").val();
			var telefonoContacto = $("#frmEditar_contacto #telefono").val();

			$.ajax({
				method: "POST",
				url: "php/details/editData_contacto.php",
				data: {
						"id_administrador"   : id_administrador,
						"nombreAdmin" : nombreAdmin,
						"empresa"   : empresa,
						"correoContacto" : correoContacto,
						"telefonoContacto" : telefonoContacto
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				location.reload(true);
			});
		});
	}
	var listar_usuario = function(){
		var id_administrador = getQuerystring('administrador');		
	    var t = $('#info_usuario').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "php/details/showData.php?id_data="+id_administrador
					},

					"columns":[
						{"data":"nameUser"},
						{"data":"password"},
						{"data":"nameDataBase"},
						{"data":"createData"},
						{"data":"modifiedData"},						
						{"defaultContent": "<button type='button' class='editar_usuario btn btn-primary' data-toggle='modal' data-target='#myModalEditar_usuario'><i class='fa fa-pencil-square-o'></i></button>"}
					]
	    });
	    
	    obtener_data_editar_usuario("#info_usuario tbody", t);
	}
	
	var obtener_data_editar_usuario = function(tbody, table){
		$(tbody).on("click", "button.editar_usuario", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var nombreAdmin = $("#frmEditar_usuario #username").val(data.nameUser);
			var empresa = $("#frmEditar_usuario #password").val( data.password );			
		});
	}

	var editar_usuario_info = function(){
		$("#editar-usuario").on("click", function(){

			var id_administrador = getQuerystring('administrador');			
			var username = $("#frmEditar_usuario #username").val();
			var password = $("#frmEditar_usuario #password").val();

			$.ajax({
				method: "POST",
				url: "php/details/editData_usuario.php",
				data: {
						"id_administrador"   : id_administrador,
						"username" : username,
						"password"   : password
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
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

//funcion para recuperar la clave del valor obtenido por paso de referencia
function getQuerystring(key) {
	var url_string = window.location;
	var url = new URL(url_string);
	var c = url.searchParams.get(key);
	return c;
};
