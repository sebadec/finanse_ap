<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"pl-PL\">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"> 
    <title>Rezultat zapytania</title>
</head>
    
<body>
    
    <table width="1000" align="center" border="1" bordercolor="#d5d5d5"  cellpadding="0" cellspacing="0">
        <tr>
        <?php
            ini_set("display_errors", 0);
            require_once "dbconnect.php";
            $polaczenie = mysqli_connect($host, $user, $password);
			mysqli_query($polaczenie, "SET CHARSET utf8");
			mysqli_query($polaczenie, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
            mysqli_select_db($polaczenie, $database);
            
            $zapytanietxt = file_get_contents("zapytanie.txt");
            
            $rezultat = mysqli_query($polaczenie, $zapytanietxt);
            $ile = mysqli_num_rows($rezultat);
            
            echo "znaleziono: ".$ile;
if ($ile>=1) 
{
echo<<<END
<td width="50" align="center" bgcolor="e5e5e5">userID</td>
<td width="100" align="center" bgcolor="e5e5e5">expensesID</td>
<td width="100" align="center" bgcolor="e5e5e5">amount</td>
<td width="100" align="center" bgcolor="e5e5e5">date</td>
<td width="50" align="center" bgcolor="e5e5e5">paymentID</td>
<td width="100" align="center" bgcolor="e5e5e5">categoryID</td>
<td width="100" align="center" bgcolor="e5e5e5">comment</td>

</tr><tr>
END;


}

	for ($i = 1; $i <= $ile; $i++) 
	{ 
		
		$row = mysqli_fetch_assoc($rezultat);
		$a1 = $row['userID'];
		$a2 = $row['expensesID'];
		$a3 = $row['amount'];
		$a4 = $row['date'];
		$a5 = $row['payment'];
		$a6 = $row['category'];
		$a7 = $row['comment'];	
		
echo<<<END
<td width="50" align="center">$a1</td>
<td width="100" align="center">$a2</td>
<td width="100" align="center">$a3</td>
<td width="100" align="center">$a4</td>
<td width="100" align="center">$a5</td>
<td width="100" align="center">$a6</td>
<td width="100" align="center">$a7</td>


</tr><tr>
END;
			
	}
	

?>


</tr></table>



</body>
</html>

