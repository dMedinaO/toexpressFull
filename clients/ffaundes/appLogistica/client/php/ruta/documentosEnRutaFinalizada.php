<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	$ruta = $_REQUEST['ruta'];

	$query = "select documento.folio, nombreCliente, comentarioRecepcion.receptor, comentarioRecepcion.estado, comentarioRecepcion.motivo, comprobante.path   from documento join cliente on (documento.rutReceptor = cliente.rutCliente) join documento_en_ruta on (documento.iddocumento = documento_en_ruta.documento) join ruta on (ruta.idrutas = documento_en_ruta.ruta) join comentarioRecepcion on (comentarioRecepcion.idcomentario = documento_en_ruta.comentario) join comprobante on (comprobante.iddocumento = documento.iddocumento) where ruta.idrutas = $ruta";
	$resultado = mysqli_query($conexion, $query);

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$arreglo["data"][] = $data;
		}

		echo json_encode($arreglo);

	}

	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
