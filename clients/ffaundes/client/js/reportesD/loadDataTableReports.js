$(window).on('load', function() {

	listarRutas();
  listarDocumentosPendientes();
  listarDocumentosFinalizados();

});
    // DATA TABLES
    // =================================================================
    // Require Data Tables
    // -----------------------------------------------------------------
    // http://www.datatables.net/
    // =================================================================

    $.fn.DataTable.ext.pager.numbers_length = 5;

    // los datos...
		var listarRutas = function(){
	    var t1 = $('#rutaData').DataTable({
	        "responsive": true,
	        "language": idioma_espanol,
	        "dom": '<"newtoolbar">frtip',

					"destroy":true,
					"ajax":{
						"method":"POST",
						"url": "../php/reportesD/showDataP.php"
					},

					"columns":[
						{"data":"nombreRuta"},
						{"data":"jornadaRuta"},
						{"data":"fecha"},
						{"data":"modifiedRuta"},
						{"data":"rutChofer"}
					]
	    });
	    $('#demo-custom-toolbar2').appendTo($("div.newtoolbar"));

	}

  var listarDocumentosPendientes = function(){
    var t1 = $('#documentosPendientes').DataTable({
        "responsive": true,
        "language": idioma_espanol,
        "dom": '<"newtoolbar">frtip',

        "destroy":true,
        "ajax":{
          "method":"POST",
          "url": "../php/reportesD/documentosEnRuta.php"
        },

        "columns":[
          {"data":"nombreCliente"},
          {"data":"rutCliente"},
          {"data":"tipoDocumento"},
          {"data":"estado"},
          {"data":"fechaEmision"},
          {"data":"monto"}
        ]
    });
    $('#demo-custom-toolbar3').appendTo($("div.newtoolbar"));

}


var listarDocumentosFinalizados = function(){
  var t1 = $('#documentosFinales').DataTable({
      "responsive": true,
      "language": idioma_espanol,
      "dom": '<"newtoolbar">frtip',

      "destroy":true,
      "ajax":{
        "method":"POST",
        "url": "../php/reportesD/documentosEnRutaFinalizada.php"
      },

      "columns":[
        {"data":"folio"},
        {"data":"nombreCliente"},
        {"data":"receptor"},
        {"data":"estado"},
        {"data":"motivo"}
      ]
  });
  $('#demo-custom-toolbar4').appendTo($("div.newtoolbar"));

}

	var detalleRuta = function(tbody, table){
		$(tbody).on("click", "button.detalle", function(){
			var data = table.row( $(this).parents("tr") ).data();

			location.href="viewDetail.php?ruta="+data.idrutas;

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
