<?php

        $archivo = $_FILES['file'];

        $templocation = $archivo["tmp_name"];
        $name = $archivo["name"];

        $pathMove = "../../docsResource/".$name;


        if(!$templocation){
                die('NO ha seleccionado ningun archivo');
        }

        if(move_uploaded_file($templocation, $pathMove)){
                echo "Archivo guardado correctamente";
        }else{
                echo "Error al guardar el archivo";
        }

        $pathData = "../../docsResource/docName.txt";
        //finalmente escribimos un archivo de texto con el nombre de la imagen...
        $file = fopen($pathData, "w");

        fwrite($file, "$name");

        fclose($file);

 ?>
