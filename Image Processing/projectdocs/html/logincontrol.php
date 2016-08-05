<?php
session_start();

    $username1 = $_POST["username"];
    $password = $_POST["pass"];
	  
	$servername = "localhost";
	$username = "root";
	$pass="uxVa6ZDrOh";
	$dbname = "proje";
	
	$con=mysqli_connect($servername,$username,$pass,$dbname);
		if (mysqli_connect_errno($con))
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	$sql = "SELECT userName,password FROM user where userName='$username1'";
	$result = $con->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
		$password1=$row["password"];
		$username2=$row["userName"];
		if($password1== $password && $username2== $username1){
				$_SESSION["isim"]=$username2;
				$con->close();
				include ("newpage.php");
				
				
		}else{
			$message = "sifre yada kullanici adi yanlis";
			echo "<script type='text/javascript'>alert('$message');</script>";
			echo "<a href=\"javascript:history.go(-1)\">GO BACK</a>";
		}
        
    }
    
} else {
			$message = "sifre yada kullanici adi yanlis";
			echo "<script type='text/javascript'>alert('$message');</script>";
			echo "<a href=\"javascript:history.go(-1)\">GO BACK</a>";
}

//$conn->close();
	 
 ?>
