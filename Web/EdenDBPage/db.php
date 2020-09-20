<?php

session_start(); 

/*Datos de conexion a la base de datos*/
$db_host = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "edenbd";
 
$con = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

?>