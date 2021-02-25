<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	$ruta = $_REQUEST['ruta'];

	$query = "select * from documento join cliente on (documento.rutReceptor = cliente.rutCliente) join documento_en_ruta on (documento.iddocumento = documento_en_ruta.documento) join ruta on (ruta.idrutas = documento_en_ruta.ruta) where ruta.idrutas = $ruta";
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
