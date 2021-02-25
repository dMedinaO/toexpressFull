
// Tables-DataTables.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(window).on('load', function() {

	listar();
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
	    var t = $('#users').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/users/showData.php"
					},

					"columns":[
						{"data":"nameUser"},
						{"data":"password"},
						{"data":"email"},
						{"data":"numberDevice"},
						{"data":"createdUser"},
						{"data":"modifiedUser"},
						{"data":"nameRol"},
						{"defaultContent": "<button type='button' class='editar btn btn-primary' data-toggle='modal' data-target='#myModalEditar'><i class='fa fa-pencil-square-o'></i></button>"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));
			obtener_data_editar("#users tbody", t);
	}

	var obtener_data_editar = function(tbody, table){
		$(tbody).on("click", "button.editar", function(){
			var data = table.row( $(this).parents("tr") ).data();
			var name = $("#frmEditar #name").val(data.nameUser);
			var passwd = $("#frmEditar #passwd").val( data.password );
			var email = $("#frmEditar #email").val( data.email );
			var phone = $("#frmEditar #phone").val( data.numberDevice );
			var iduser = $("#frmEditar #iduser").val( data.iduser );
		});
	}

	var editar = function(){
		$("#editar-usuario").on("click", function(){

			var name = $("#frmEditar #name").val();
			var passwd = $("#frmEditar #passwd").val();
			var email = $("#frmEditar #email").val();
			var phone = $("#frmEditar #phone").val();
			var iduser = $("#frmEditar #iduser").val();

			$.ajax({
				method: "POST",
				url: "../php/users/editData.php",
				data: {
						"iduser"   : iduser,
						"name" : name,
						"passwd"   : passwd,
						"email" : email,
						"phone" : phone
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
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
