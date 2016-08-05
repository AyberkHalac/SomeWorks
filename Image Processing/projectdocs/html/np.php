<?php
	session_start();
	$user=$_SESSION["isim"];
	$_SESSION["sex"]= $_POST['gender'];
	$_SESSION["price"]= $_POST['price'];
	$servername = "localhost";
	$username = "root";
	$pass="uxVa6ZDrOh";
	$dbname = "proje";
	sleep(18);
	$con=mysqli_connect($servername,$username,$pass,$dbname);
		if (mysqli_connect_errno($con))
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
	$sql = "SELECT size FROM user where userName='$user'";
	$result = $con->query($sql);
		if ($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				$count=$row["size"];
				if($count==1){
					$con->close();
					include ("slider.php");
				}else if($count == -1){
						$con->close();
					echo ("<SCRIPT LANGUAGE='JavaScript'>
							window.alert('Yuz Algilanamadi')
							window.location.href='/newpage.php';
						</SCRIPT>");
					exit();
				}else if($count== 0){
						$con->close();
					echo ("<SCRIPT LANGUAGE='JavaScript'>
							window.alert('Resim islenemedi.Lutfen tekrar deneyiniz.')
							window.location.href='/newpage.php';
						</SCRIPT>");
					exit();
				
				}
			}
		}
	
	$con->close();
	?>