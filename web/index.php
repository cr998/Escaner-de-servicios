<html>
	<head>
		<title>Buscador de servicios</title>
		<link rel="stylesheet" type="text/css" href="main.css">
	</head>
	
	<body>
		<?php require "config.php"; ?>
		<center>
			<form method="POST" action="">
				<input type="text" name="contiene" size="52" value="<?php if(isset($_POST['contiene'])){echo htmlentities($_POST['contiene']);}?>">
				<input type="submit" value="Buscar">
			</form>
			<?php
				if(isset($_POST['contiene']))
				{
					$buscar = mysql_real_escape_string($_POST['contiene']);
					echo "<table>
	<tr>
		<td><b>IP</b></td>
		<td><b>Puerto</b></td>
		<td><b>Banner</b></td>
	</tr>";
	
					$resultado = mysql_query("SELECT * FROM puertos WHERE respuesta LIKE '%$buscar%'");
					while ($fila = mysql_fetch_assoc($resultado))
					{
						$ip = mysql_query("SELECT * FROM ips WHERE id = '".$fila['idip']."'");
						$fila2 = mysql_fetch_assoc($ip);
						$fila2['ip']=file_get_content("http://api.hackertarget.com/reversedns/?q="+$fila2['ip'])
						echo "<tr><td align=\"center\">".htmlentities($fila2['ip'])."</td><td align=\"center\">".htmlentities($fila['puerto'])."</td><td><pre>".htmlentities($fila['respuesta'])."</pre></td></tr>"; 
					}
					echo "</table>";
				}
			?>
			<br>
			<br>
			<pre>Powered by v4char</pre>
		</center>
	</body>
</html>
