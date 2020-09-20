<?php 
    include("db.php");

    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $query = "DELETE FROM shampoos WHERE id = $id";
        $result = mysqli_query($con, $query);
        if(!$result){
            die("Fallo en la query de eliminacion");
        }

        $_SESSION['message'] = 'Shampoo eliminado de la base de datos de EDEN';
        header("Location: index.php");
    }
?>