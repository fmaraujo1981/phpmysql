<?php

include_once 'db.php';

/* code for TIME insert */
if(isset($_POST['save']))
{

     $nome = $MySQLiconn->real_escape_string($_POST['nome']);
	 $cpf = $MySQLiconn->real_escape_string($_POST['cpf']);
	 $logradouro = $MySQLiconn->real_escape_string($_POST['logradouro']);
	 $numero = $MySQLiconn->real_escape_string($_POST['numero']);
	 $complemento = $MySQLiconn->real_escape_string($_POST['complemento']);
     $cidade = $MySQLiconn->real_escape_string($_POST['cidade']);

     $telefone = $MySQLiconn->real_escape_string($_POST['telefone']);

     $time = $MySQLiconn->real_escape_string($_POST['time']);
	 
	 $SQL = $MySQLiconn->query("INSERT INTO torcedores(nome,cpf,logradouro,numero,complemento,cidade_idcidade,telefone,times_idtime) 
	 VALUES('$nome','$cpf','$logradouro','$numero','$complemento','$cidade','$telefone','$time')");
	 
	 if(!$SQL)
	 {
		 echo $MySQLiconn->error;
	 } 
}
/* code for TIME insert */


/* code for TIME delete */
if(isset($_GET['del']))
{
	$SQL = $MySQLiconn->query("DELETE FROM torcedores WHERE idtorcedore=".$_GET['del']);
	header("Location: index.php");
}
/* code for TIME delete */



/* code for TIME update */
if(isset($_GET['edit']))
{
	$SQL = $MySQLiconn->query("SELECT * FROM torcedores WHERE idtorcedore=".$_GET['edit']);
	$getROW = $SQL->fetch_array();
}

if(isset($_POST['update'])){

	$SQL = $MySQLiconn->query("UPDATE torcedores SET     nome='".$_POST['nome']."'
												,cidade_idcidade='".$_POST['cidade']."'
												,cpf='".$_POST['cpf']."'
												,logradouro='".$_POST['logradouro']."'
												,numero='".$_POST['numero']."'
												,telefone='".$_POST['telefone']."'
												,times_idtime='".$_POST['time']."'
												WHERE idtorcedore=".$_GET['edit']);
	header("Location: index.php");
}
/* code for TIME update */

?>