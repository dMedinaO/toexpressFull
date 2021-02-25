<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");


	$query = "select * from vehiculo where vehiculo.patente not in (select vehiculoAsignado.vehiculo_patente from vehiculoAsignado)";
	$resultado = mysqli_query($conexion, $query);

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			echo '<option value="'.$data["patente"].'">'.$data["patente"].'</option>';
		}

	}

	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
