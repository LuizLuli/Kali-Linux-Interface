<?php

	$id = $_GET['id'];

	require("assets/includes/config.php"); 

	$con = getConnectionDB() or die ("Could not connect to database.");
	$sql = $con->prepare("DELETE FROM reports WHERE id = '$id' ");

	if ($sql->execute()) {
		echo "<script> alert('Relatório removido com sucesso.');</script>";
	} else {

		echo "<script> alert('Erro ao remover relatório. Por favor, tente novamente.');</script>";

	}

	echo "<script>window.location.href = 'reports.php'</script>";
?>