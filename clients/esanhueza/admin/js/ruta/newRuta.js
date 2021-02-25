$(document).ready(function() {

	$('#newRuta').bootstrapValidator({
				feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
						nameRuta: {
								validators: {
										notEmpty: {
												message: 'Nombre de ruta es obligatorio'
										}
								}
						}
				}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			$('#loading').show();
			var nameRuta = $("#newRuta #nameRuta").val();
			var jornada = $("#newRuta #jornada").val();
      var chofer = $("#newRuta #chofer").val();

      //hacemos la llamada por ajax
      $.ajax({
				method: "POST",
				url: "../php/ruta/newRuta.php",
				data: {
						"nameRuta"   : nameRuta,
						"jornada"   : jornada,
						"chofer"   : chofer
					}

			}).done( function( info ){

				var json_info = JSON.parse( info );
				console.log(json_info);

        if (json_info.respuesta == "BIEN"){
          location.href = "../viewRuta/viewDetail.php?ruta="+json_info.ruta;
        }else{
          $('#loading').hide();
          $('#errorResponse').show();
          setTimeout("location.href=''", 5000);
        }
			});
    });
});
