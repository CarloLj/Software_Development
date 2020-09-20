envia.php
<html>
	<body>
		<form action="recibe.php" method="POST" target="_blank">
		
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
    			<input type="radio" name="Genero" value="1" checked> HOMBRE<br>
    			<input type="radio" name="Genero" value="2"> MUJER<br>
  
  		</p>
		
		<p>
    			Titulo:<br>
    			<input type="checkbox" name="titulo[]" value="TGO"> TGO<br>
    			<input type="checkbox" name="titulo[]" value="LIC"> LIC<br>
				<input type="checkbox" name="titulo[]" value="MAESTRO"> MAESTRO<br>
    			<input type="checkbox" name="titulo[]" value="DOC"> DOC<br>
  
  		</p>
		
  		<p>
    			<input type="submit" value="Enviar datos">
    			<input type="reset" value="Restaurar formulario">
  		</p>
		</form>
	</body>
</html>

