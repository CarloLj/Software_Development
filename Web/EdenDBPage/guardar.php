<?php

include("db.php");

    if(isset($_POST['guardar'])){
        $nombre = $_POST['nombre'];
        $color = $_POST['color'];
        $ingredientes = $_POST['ingredientes'];
        $olor = $_POST['olor'];
        $ml = $_POST['ml'];

        $query = "INSERT INTO shampoos(nombre,color,ingredientes,olor,ml) VALUES ('$nombre','$color','$ingredientes','$olor','$ml')";
        $result = mysqli_query($con, $query);
        if(!$result){
            die("Error al insertar en la BD");
        }

        $_SESSION['message'] = '¡GENIAL! Se ha agregado el tu shampoo personalizado a la base de datos de EDEN';
        $_SESSION['message_type'] = 'success';

        header("Location: index.php");
    }
?>