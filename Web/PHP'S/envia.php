envia.php
<html>
	<body>
		<form action="recibe.php" method="post" target="_blank">
		
		<p>
    	<br>Nomina: <input type="text" name="NOMINA"></label><br>
  		</p>
		
		<p>
    	<br>Nombre: <input type="text" name="NOMBRE"> </label><br>
  		</p>
		
		<p>
    	<br>Apellido: <input type="text" name="APELLIDO"> </label><br>
  		</p>
		
		<p>
    	Academia: <select name="ACADEMIA"> 
		 <option> Informatica </option>
		  <option> Computación </option>
		   <option> Infraestructura de Tecnologias de Informacion </option>
		    <option> Sistemas Analógicos </option>
			 <option> Sistemas Digitales </option>
			  <option> Inglés </option>
			   <option> Matemáticas </option>
			   	<option> Química </option>
				 <option> Dibujo</option>
			      <option> Técnicas Industriales </option>
				   <option> Ciencias Sociales y Humanidades	 </option>
			        <option> Metodologías </option>
		</select>
		
  		</p>
		
  		<p>
    			Sexo:<br>
    			<label><input type="radio" name="HOMBRE" value="1"> HOMBRE</label><br>
    			<label><input type="radio" name="MUJER" value="2"> MUJER</label><br>
  
  		</p>
		
		<p>
    			Titulo:<br>
    			<label><input type="checkbox" name="titulo" value="3"> TGO</label><br>
    			<label><input type="checkbox" name="titulo" value="4"> LIC</label><br>
				<label><input type="checkbox" name="titulo" value="5"> MAESTRO</label><br>
    			<label><input type="checkbox" name="titulo" value="6"> DOC</label><br>
  
  		</p>
		
  		<p>
    			<input type="submit" value="Enviar datos">
    			<input type="reset" value="Restaurar formulario">
  		</p>
		</form>
	</body>
</html>

