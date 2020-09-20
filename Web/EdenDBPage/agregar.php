<?php include ("db.php") ?>
<?php include ("includes/header.php") ?>

    <div class="container p-4">
        <div class="row">
            <div class="col-md-16">

                <?php if(isset($_SESSION['message'])){ ?>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <?= $_SESSION['message'] ?> <!--<strong>Genial!</strong> Has agregado correctamente tu pedido de shampoo personalizado.-->
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                <?php session_unset(); } ?>

                <div class="card card-body">
                    <form action="guardar.php" method="POST">
                        <div class="form-group">

                            <input type="text" name="nombre" class= "form control"
                            placeholder = "Nombre de shampoo" autofocus>

                            <input type="text" name="color" class= "form control"
                            placeholder = "Color de shampoo">

                            <div class="form-group">
                                <textarea name="ingredientes" rows="2" class="form-control" 
                                placeholder = "Ingredientes"></textarea>
                            </div>

                            <input type="text" name="olor" class= "form control"
                            placeholder = "Olor">

                            <input type="text" name="ml" class= "form control"
                            placeholder = "# Mililitros">

                            <input type="submit" class="btn btn-success btn-block" name="guardar" value ="Guardar">
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php include ("includes/footer.php") ?>