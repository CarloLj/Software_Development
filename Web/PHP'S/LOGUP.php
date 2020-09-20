<?PHP
$hostname_localhost="localhost";
$database_localhost="c0860121_cerve";
$username_localhost="c0860121";
$password_localhost="Atwedu101";

$json=array();

 if(isset($_GET["correo"]) && isset($_GET["contraseña"]) && isset($_GET["nombre"]) && isset($_GET["apellido"])){
  $id=null;
  $correo=$_GET['correo'];
  $contrasena=$_GET['contraseña'];
  $nombre=$_GET['nombre'];
  $apellido=$_GET['apellido'];

  $conexion = new mysqli($hostname_localhost, $username_localhost, $password_localhost, $database_localhost);
  
  
  $insert="INSERT INTO cliente VALUES (null , '$correo','$contrasena','$nombre','$apellido')";
 
  if($conexion->query($insert)===TRUE){  
	mysqli_set_charset($conexion, 'utf8');
   $resultado = $conexion->query("SELECT * FROM cliente WHERE id = (SELECT MAX(id) FROM cliente)");
   if($registro=mysqli_fetch_array($resultado)){
    $json['cliente'][]=$registro;
   }
   mysqli_close($conexion);
   echo json_encode($json);
   
  }else{
	  echo 'algo fallo';
   $resulta["id"]=0;
   $resulta["correo"]="NO registra";
   $resulta["contrasena"]="NO registra";
   $resulta["nombre"]="NO registra";
   $resulta["apellido"]="NO registra";
   $json['cliente'][]=$resulta;
   echo json_encode($json);

  }
  
 }else{
  $resulta["id"]=0;
   $resulta["correo"]="WS NO registra";
   $resulta["contrasena"]=" WS NO registra";
   $resulta["nombre"]="WS NO registra";
   $resulta["apellido"]="WS NO registra";
  $json['cliente'][]=$resulta;
  echo json_encode($json);

 }
 
?>