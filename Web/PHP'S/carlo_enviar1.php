carlo_envia.php
<html>
	<body>
		<form action="carlo_recibe1.php" method="POST" target="_blank">
		
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
		 <option value="1" >Informatica </option>
		   <option value="2" >Computación </option>
		    <option value="3" >Infraestructura de Tecnologias de Informacion </option>
		     <option value="4" >Sistemas Analógicos </option>
			 <option value="5" >Sistemas Digitales </option>
			   <option value="6" >Inglés </option>
			    <option value="7" >Matemáticas </option>
			   	 <option value="9"> Química </option>
				  <option value="10"> Dibujo</option>
			       <option value="11"> Técnicas Industriales </option>
				   <option value="12"> Ciencias Sociales y Humanidades	 </option>
			         <option value="13" >Metodologías </option>
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

