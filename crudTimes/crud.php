<?php

include_once 'db.php';

/* code for TIME insert */
if(isset($_POST['save']))
{

     $nome = $MySQLiconn->real_escape_string($_POST['nome']);
     $cidade = $MySQLiconn->real_escape_string($_POST['cidade']);
	 $uf = $MySQLiconn->real_escape_string($_POST['uf']);
	 $bandeira = $MySQLiconn->real_escape_string($_POST['bandeira']);
	
	 $SQL = $MySQLiconn->query("INSERT INTO time(nome,cidade,uf,bandeira) VALUES('$nome','$cidade','$uf','$bandeira')");
	 
	 if(!$SQL)
	 {
		 echo $MySQLiconn->error;
	 } 
}
/* code for TIME insert */


/* code for TIME delete */
if(isset($_GET['del']))
{
	$SQL = $MySQLiconn->query("DELETE FROM time WHERE id=".$_GET['del']);
	header("Location: index.php");
}
/* code for TIME delete */



/* code for TIME update */
if(isset($_GET['edit']))
{
	$SQL = $MySQLiconn->query("SELECT * FROM time WHERE id=".$_GET['edit']);
	$getROW = $SQL->fetch_array();
}

if(isset($_POST['update']))
{
	$SQL = $MySQLiconn->query("UPDATE time SET     nome='".$_POST['nome']."'
												,cidade='".$_POST['cidade']."'
												,uf='".$_POST['uf']."'
												,bandeira='".$_POST['bandeira']."'
												WHERE id=".$_GET['edit']);
	header("Location: index.php");
}
/* code for TIME update */

?>