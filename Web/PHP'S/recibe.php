recibe.php
<?php

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
		
		
?>