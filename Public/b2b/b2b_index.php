<?php

$servername = "172.17.0.2";
$username = "userb2b";
$password = "userpassword";
$dbname = "b2b";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) 
{
	die("Connection failed: " . $conn->connect_error);
}
else
{
	$sql = "SELECT * FROM stock";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) 
	{
		while($row = $result->fetch_assoc()) 
		{
			echo " - Name: " . $row["name"]. " Price : " . $row["price"]. "<br>";
		}
	}
	$conn->close();
}
?>