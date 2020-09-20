<?PHP
$hostname_localhost="localhost";
$database_localhost="c0860121_cerve";
$username_localhost="c0860121";
$password_localhost="Atwedu101";
$json=array();

	if(isset($_GET["nombre"]) && isset($_GET["contraseña"])){
		
		$nombre=$_GET['nombre'];
		$contrasena=$_GET['contraseña'];
		
		$conexion=mysqli_connect($hostname_localhost,$username_localhost,$password_localhost,$database_localhost)or die ('algo ha ido mal al conectarse a la base de datos');
		
		$consulta="SELECT id,correo , contraseña,  nombre, apellido FROM cliente WHERE nombre= '$nombre' AND contraseña = '$contrasena'";
		mysqli_set_charset($conexion, 'utf8');
		
		$resultado=mysqli_query($conexion,$consulta)or die ('no salio la consulta');
		
		
		if($consulta){
			if($reg=mysqli_fetch_array($resultado)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}

		else{
			$results["user"]='no hay';
			$results["pwd"]='no hay';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
		   	$results["user"]='no hay';
			$results["pwd"]='no hay';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>