carlo_recibe1.php
<?php

$usuario = "root";
$contrasena = "";  // en mi caso tengo contraseña pero en casa caso introducidla aquí.
$servidor = "localhost";
$basededatos = "ceti6h2";

$conexion = mysqli_connect( $servidor, $usuario, "" ) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );
$consulta = "SELECT * FROM docente";
$resultado = mysqli_query( $conexion , $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");
echo "<br>";
echo "Conectado Satisfactoriamente!!";
echo "<br>";
echo "<br>";
/*
echo " Esta es la tabla antes de la insercion de datos" . PHP_EOL;
echo "<table borde='2'>";
echo "<tr>";
echo "<th>Nomina</th>";
echo "<th>Nombre</th>";
echo "<th>Apellidos</th>";
echo "<th>Academia</th>";
echo "</tr>";


while ($columna = mysqli_fetch_array( $resultado ))
{
 echo "<tr>";
 echo "<td>" . $columna['Nomina'] . "</td><td>" . $columna['Nombre'] . "</td><td>" . $columna['Apellidos'] . "</td><td>" . $columna['Academia'] . "</td>";
 echo "</tr>";
}

echo "</table>";
*/
sleep(1);

$nomina = $_POST['NOMINA']; 
$nombre = $_POST['NOMBRE']; 
$apellido = $_POST['APELLIDO']; 
$select = $_POST['ACADEMIA'];  

	
$sql = "INSERT INTO docente VALUES ('$nomina', '$nombre', '$apellido','$select')";
$insercion = mysqli_query( $conexion , $sql ) or die ( "Algo ha ido mal en la consulta a la base de datos");

echo " Esta es la tabla antes de la insercion de datos(la proxima que envie se actualizara)";
echo "<table borde='2'>";
echo "<tr>";
echo "<th>Nomina</th>";
echo "<th>Nombre</th>";
echo "<th>Apellidos</th>";
echo "<th>Academia</th>";
echo "</tr>";
while ($columna = mysqli_fetch_array( $resultado ))
	{
	echo "<tr>";
	echo "<td>" . $columna['Nomina'] . "</td><td>" . $columna['Nombre'] . "</td><td>" . $columna['Apellidos'] . "</td><td>" . $columna['Academia'] . "</td>";
	echo "</tr>";
	}
echo "</table>";

mysqli_close( $conexion );

/*
$nomina = $_POST['NOMINA']; 
		echo $nomina . PHP_EOL; 
		
	$nombre = $_POST['NOMBRE']; 
		echo $nombre . PHP_EOL; 
		
	$apellido = $_POST['APELLIDO']; 
		echo $apellido . PHP_EOL; 

	$select = $_POST['ACADEMIA'];  
		echo $select . PHP_EOL; 
		
	$generoval = $_POST['Genero']; 
    if($generoval == "1")
    { 
        echo("Hombre"). PHP_EOL;
    }
    else if ($generoval == "2")
    {
        echo("Mujer"). PHP_EOL;
    }
		
	$titValue = $_POST['titulo']; 
		
		foreach($titValue as $i) 
			{ 
			echo $i . PHP_EOL; 
			}
		*/
?>