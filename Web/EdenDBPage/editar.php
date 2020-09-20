<?php 
    include("db.php");

    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $query = "SELECT * FROM shampoos WHERE id = $id";
        $result = mysqli_query($con, $query);

        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_array($result);
            $nombre = $row['nombre'];
            $color = $row['color'];
            $ingredientes = $row['ingredientes'];
            $olor = $row['olor'];
            $ml = $row['ml'];
        }
        //if(!$result){
        //    die("Fallo en la query de eliminacion");
       // }
        //$_SESSION['message'] = 'Shampoo modificado de la base de datos de EDEN';
        //header("Location: index.php");
    }

    if(isset($_POST['actualizar'])){
        echo 'Intentando actualizar';
        $id = $_GET['id'];
        $nombre = $_POST['nombre'];
        $color = $_POST['color'];
        $ingredientes = $_POST['ingredientes'];
        $olor = $_POST['olor'];
        $ml = $_POST['ml'];

        $query = "UPDATE shampoos set nombre = '$nombre', color ='$color', ingredientes ='$ingredientes', olor ='$olor', ml ='$ml' WHERE id = '$id'";
        mysqli_query($con, $query);
        $_SESSION['message'] = 'Datos actualizados de tu shampoo personalizado a la base de datos de EDEN';
        header("Location: index.php");
        
    }

?>

<?php include("includes/header.php") ?>

<div class= "container p-4">
    <div class="row">
        <div class="col-md-4 mx-auto">
            <div class="card card-body">
                <form action="editar.php?id=<?php echo $_GET['id'];?>" method="POST">
                    <div class="form-group">
                        <input type="text" name="nombre" value="<?php echo $nombre; ?>" 
                        class ="form-control placeholder="Actualizar el nombre">
                    </div>
                    <div class="form-group">
                        <input type="text" name="color" value="<?php echo $color; ?>" 
                        class ="form-control" placeholder="Actualizar el color">
                    </div>
                    <div class="form-group">
                        <textarea name="ingredientes" rows="2" class="form-control" 
                        placeholder ="Actualizar los ingredientes"><?php echo $ingredientes; ?></textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" name="olor" value="<?php echo $olor; ?>" 
                        class ="form-control placeholder="Actualizar el olor">
                    </div>
                    <div class="form-group">
                        <input type="text" name="ml" value="<?php echo $ml; ?>" 
                        class ="form-control placeholder="Actualizar los mililitros">
                    </div>

                    <button class="btm btn-success" name="actualizar">
                        Actualizar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include("includes/footer.php") ?>