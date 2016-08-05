<html>
<head><title>register</title></head>
<body>


<?php
	$mail = $_POST["mail"];
    $kullaniciadi = $_POST["username"];
    $sifre = $_POST["pass"];
   

	$servername = "localhost";
	$username = "root";
	$dbname = "proje";
	$pass = "uxVa6ZDrOh";
	// Create connection
	$conn = new mysqli($servername, $username, $pass, $dbname);
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}	 

	$sql = "INSERT INTO user (userName, email, password)
	VALUES ('$kullaniciadi', '$mail', '$sifre')";
	
	if ($conn->query($sql) === TRUE) {
		$sql="INSERT INTO picture (user) VALUES ('$kullaniciadi')";
		if ($conn->query($sql) === TRUE) {
			include ("index.html");
		}else{
			echo "Error: " . $sql . "<br>" . $conn->error;
		}	
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}

	$conn->close();
?>
</body>
</html>