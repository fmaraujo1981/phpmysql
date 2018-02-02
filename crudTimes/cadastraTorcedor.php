<?php
include_once 'crudTorcedor.php';
?>

<html lang="pt-BR">
	<head>
		<meta charset="UTF-8">
		<title>31012018 - BootStrap</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="style.css">
	</head>

<body>
<center>
<div id="header">
	<label>Cadastro de Torcedores</label>
</div>

<button data-toggle="collapse" data-target="#demo">[+] Adicionar</button>

<div id="torcedores" >


<div id="form" class="form-group">
<form method="post">
<table width="100%" border="1" cellpadding="15">
<tr>
<td><input type="text" name="nome" placeholder="Nome" value="<?php if(isset($_GET['edit'])) echo $getROW['nome'];  ?>" /></td>
</tr>
<tr>
<td><input type="text" name="cpf" placeholder="CPF" value="<?php if(isset($_GET['edit'])) echo $getROW['cpf'];  ?>" /></td>
</tr>
<tr>
<td><input type="text" name="logradouro" placeholder="Logradouro" value="<?php if(isset($_GET['edit'])) echo $getROW['logradouro'];  ?>" /></td>
</tr>
</tr>
<tr>
<td><input type="number" name="numero" placeholder="numero" value="<?php if(isset($_GET['edit'])) echo $getROW['numero'];  ?>" /></td>
</tr>
</tr>
<tr>
<td><input type="text" name="complemento" placeholder="complemento" value="<?php if(isset($_GET['edit'])) echo $getROW['complemento'];  ?>" /></td>
</tr>
<tr>
<td>

<input type="text" name="cidade" placeholder="Cidade" value="<?php if(isset($_GET['edit'])) echo $getROW['cidade_idcidade'];  ?>" />

<select name="cidade">
<option> SELECIONE A CIDADE </option>
<?php 

$res = $MySQLiconn->query("
			SELECT cidade.idcidade, cidade.nome as cidade,estado.sigla uf 
			FROM cidade,estado 
			where cidade.estado_idestado = estado.idestado 
			order by estado.sigla, cidade.nome");
while($row=$res->fetch_array()){
	echo "<option value=".$row['idcidade'].">".$row['uf']."-".$row['cidade']."</option>"; 
	
}


?>
</select>
</td>


</tr>
<tr>
<td><input type="tel" name="telefone" placeholder="Telefone" value="<?php if(isset($_GET['edit'])) echo $getROW['telefone'];  ?>" /></td>
</tr>
<tr>
<td><input type="text" name="time" placeholder="time" value="<?php if(isset($_GET['edit'])) echo $getROW['times_idtime'];  ?>" />

<select name="cidade">
<option> SELECIONE UM TIME </option>
<?php 

$res = $MySQLiconn->query("SELECT * FROM times ");
while($row=$res->fetch_array()){
	echo "<option value=".$row['idtime'].">".$row['nome']."</option>"; 
	
}
?>
</select>
</td>
</tr>
<tr>
<td>
<?php
if(isset($_GET['edit']))
{
	?>
	<button type="submit" name="update" >update</button>
	<?php
}
else
{
	?>
	<button type="submit" name="save">Salvar</button>
	<?php
}
?>
</td>
</tr>
</table>
</form>
</div>
</div>



<br/><br />

<table class="table table-striped">
<?php
$res = $MySQLiconn->query("SELECT * FROM torcedores");
while($row=$res->fetch_array())
{
	?>
    <tr>
    <td><?php echo $row['idtorcedore']; ?></td>
    <td><?php echo $row['nome']; ?></td>
    <td><?php echo $row['logradouro']; ?></td>
	<td><?php echo $row['numero']; ?></td>
	<td><?php echo $row['complemento']; ?></td>
	<td><?php echo $row['telefone']; ?></td>
	<td><?php echo $row['cidade_idcidade']; ?></td>
	<td><?php echo $row['times_idtime']; ?></td>
    <td><a data-toggle="collapse in" href="?edit=<?php echo $row['idtorcedore']; ?>">edit</a></td>
    <td><a href="?del=<?php echo $row['idtorcedore']; ?>" onclick="return confirm('sure to delete !'); " >delete</a></td>
    </tr>
    <?php
}
?>
</table>
</div>
</center>
</body>
</html>