<?php include ("db.php") ?>
<?php include ("includes/header.php") ?>

    <div class="container p-4">
            <div class="col-md-16">
                    <?php if(isset($_SESSION['message'])){ ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <?= $_SESSION['message'] ?> <!--<strong>Genial!</strong> Has agregado correctamente tu pedido de shampoo personalizado.-->
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                    <?php session_unset(); } ?>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Color</th>
                                <th>Ingredientes</th>
                                <th>Olor</th>
                                <th># Mililitros</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $query = "SELECT * FROM shampoos";
                                $result_shampoos = mysqli_query($con, $query);

                                while($row = mysqli_fetch_array($result_shampoos)){ ?>
                                    <tr>
                                        <td><?php echo $row['nombre']?> </td>
                                        <td><?php echo $row['color']?> </td>
                                        <td><?php echo $row['ingredientes']?> </td>
                                        <td><?php echo $row['olor']?> </td>
                                        <td><?php echo $row['ml']?> </td>
                                        <td>
                                            <a href="editar.php?id=<?php echo $row['id']?>" class="btn btn-secondary">
                                            <i class="fas fa-marker"></i>
                                            </a>
                                            <a href="eliminar.php?id=<?php echo $row['id']?>" class="btn btn-danger">
                                            <i class="far fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                            <?php } ?>
                        </tbody>


                    </table>
            </div>
        </div>

    </div>

<?php include ("includes/footer.php") ?>