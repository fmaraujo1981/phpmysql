<?php
include_once 'crud.php';
?>

<html lang="pt-BR">
	<head>
		<meta charset="UTF-8">
		<title>Torcedores Times Campeonatos</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="style.css">
	</head>

<body>
<center>
<div id="header">
	<label>Menu:</label>
	<a href="cadastraTorcedor.php"> Torcedores </a>
</div>
<select name="meses">
<option value="1"> Janeiro </option>
<option value="2"> Fevereiro </option>
<option value="3"> Março </option>
<option value="4"> Abril </option>
<option value="5"> Maio </option>

</select>

<br/><hr/>
<h2>Times</h2>
<table class="table table-striped" >
<?php
$res = $MySQLiconn->query("SELECT * FROM times");
while($row=$res->fetch_array())
{
	?>
   
<tr>
    <td><?php echo $row['nome']; ?></td>
	<td><?php echo $row['bandeira']; ?></td>
    <td><a data-toggle="collapse"  href="?edit=<?php echo $row['idtime']; ?>" >edit</a></td>
    <td><a href="?del=<?php echo $row['idtime']; ?>" onclick="return confirm('sure to delete !'); " >delete</a></td>
    </tr>
    <?php
}
?>
</table>
</div>
</center>
</body>
</html>