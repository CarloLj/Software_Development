<?PHP
$hostname_localhost="localhost";
$database_localhost="pi";
$username_localhost="root";
$password_localhost="";

$json=array();
 if(isset($_GET["nombre"]) && isset($_GET["apellidop"]) && isset($_GET["apellidom"]) && isset($_GET["usuario"]) && isset($_GET["contrasena"]) && isset($_GET["telefono"]) && isset($_GET["email"])){
  $nombre=$_GET['nombre'];
  $apellidop=$_GET['apellidop'];
  $apellidom=$_GET['apellidom'];
  $usuario=$_GET['usuario'];
  $contrasena=$_GET['contrasena'];
  $telefono=$_GET['telefono'];
  $email=$_GET['email'];

  $conexion = new mysqli($hostname_localhost, $username_localhost, $password_localhost, $database_localhost);
  
  
  $insert="INSERT INTO cliente (nombre, apellidop, apellidom, usuario, contrasena, telefono, email) VALUES ('{$nombre}','{$apellidop}','{$apellidom}','{$usuario}','{$contrasena}','{$telefono}','{$email}')";
 
  if($conexion->query($insert)===TRUE){  

   $resultado = $conexion->query("SELECT * FROM cliente WHERE idcliente = (SELECT MAX(idcliente) FROM cliente)");
  
   if($registro=mysqli_fetch_array($resultado)){
    $json['cliente'][]=$registro;
   }
   mysqli_close($conexion);
   echo json_encode($json);
   
  }else{
   $resulta["idcliente"]=0;
   $resulta["nombre"]="NO registra";
   $resulta["apellidop"]="NO registra";
   $resulta["apellidom"]="NO registra";
   $resulta["usuario"]="NO registra";
   $resulta["contrasena"]="NO registra";
   $resulta["telefono"]=0;
   $resulta["email"]="NO registra";
   $json['cliente'][]=$resulta;
   echo json_encode($json);

  }
 }else{
  $resulta["idcliente"]=0;
  $resulta["nombre"]="WS NO registra";
  $resulta["apellidop"]="WS NO registra";
  $resulta["apellidom"]="WS NO registra";
  $resulta["usuario"]="WS NO registra";
  $resulta["contrasena"]="WS NO registra";
  $resulta["telefono"]=0;
  $resulta["email"]="WS NO registra";
  $json['cliente'][]=$resulta;
  echo json_encode($json);

 }
 
?>