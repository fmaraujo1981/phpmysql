<?php
include_once 'crud.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PHP CRUD</title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
<?php
$res = $MySQLiconn->query("SELECT * FROM time");
while($row=$res->fetch_array())
{
	?>
	
	<div class='<?php echo $row['uf']; ?>'>
    <?php echo $row['id']; ?>
	<?php echo $row['nome']; ?><br/>
    <?php echo $row['cidade']; ?><br/>
	<?php echo $row['uf']; ?><br/>
	<?php echo $row['bandeira']; ?><br/>
	<a href="?edit=<?php echo $row['id']; ?>" onclick="return confirm('Tem certeza que quer Alterar ?'); " >Editar</a>
	<a href="?del=<?php echo $row['id']; ?>" onclick="return confirm('Tem certeza que quer  APAGAR ?'); " >Apagar</a>
    <br/>
	</div>
    <?php
}
?>
</body>