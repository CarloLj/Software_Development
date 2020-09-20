<?PHP
$hostname_localhost="localhost";
$database_localhost="c0860121_cerve";
$username_localhost="c0860121";
$password_localhost="Atwedu101";

$json=array();

 if(isset($_GET["Nombredest"]) && isset($_GET["Apellidodest"]) && isset($_GET["Telefono"]) && isset($_GET["Codigopostal"])&& isset($_GET["Colonia"]) && isset($_GET["Calle"]) && isset($_GET["Numeroext"]) && isset($_GET["Numeroint"])&& isset($_GET["Referencias"])&& isset($_GET["idcliente"])){
  $id=null;
  $Nombredest=$_GET['Nombredest'];
  $Apellidodest=$_GET['Apellidodest'];
  $Telefono=$_GET['Telefono'];
  $Codigopostal=$_GET['Codigopostal'];
  $Colonia=$_GET['Colonia'];
  $Calle=$_GET['Calle'];
  $Numeroext=$_GET['Numeroext'];
  $Numeroint=$_GET['Numeroint'];
  $Referencias=$_GET['Referencias'];
  $idcliente=$_GET['idcliente'];

  $conexion = new mysqli($hostname_localhost, $username_localhost, $password_localhost, $database_localhost);

  $insert="INSERT INTO tarjeta VALUES (null , '$Nombredest','$Apellidodest','$Telefono','$Codigopostal','$Colonia','$Calle','$Numeroext','$Numeroint','$Referencias','$idcliente')";
 
  if($conexion->query($insert)===TRUE){  
	mysqli_set_charset($conexion, 'utf8');
   $resultado = $conexion->query("SELECT * FROM tarjeta WHERE id = (SELECT MAX(id) FROM tarjeta)");
   if($registro=mysqli_fetch_array($resultado)){
    $json['cliente'][]=$registro;
   }
   mysqli_close($conexion);
   echo json_encode($json);
   
  }else{
	  echo 'algo fallo';
   $resulta["id"]=0;
   $resulta["Nombredest"]="NO registra";
   $resulta["Apellidodest"]="NO registra";
   $resulta["Telefono"]="NO registra";
   $resulta["Codigopostal"]="NO registra";
   $resulta["Colonia"]="NO registra";
   $resulta["Calle"]="NO registra";
   $resulta["Numeroext"]="NO registra";
   $resulta["Numeroint"]="NO registra";
   $resulta["Referencias"]="NO registra";
   $resulta["idcliente"]="NO registra";
   $json['cliente'][]=$resulta;
   echo json_encode($json);

  }
  
 }else{
   $resulta["id"]=0;
   $resulta["Nombredest"]="WS NO registra";
   $resulta["Apellidodest"]="WS NO registra";
   $resulta["Telefono"]="WS NO registra";
   $resulta["Codigopostal"]="WS NO registra";
   $resulta["Colonia"]="WS NO registra";
   $resulta["Calle"]="WS NO registra";
   $resulta["Numeroext"]="WS NO registra";
   $resulta["Numeroint"]="WS NO registra";
   $resulta["Referencias"]="WS NO registra";
   $resulta["idcliente"]="WS NO registra";
  $json['cliente'][]=$resulta;
  echo json_encode($json);

 }
 
?>