<?php
session_start();

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 2000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        
		if(rename($target_file,"uploads/".$_SESSION["isim"].".jpeg")){
					$userPic="uploads/".$_SESSION["isim"].".jpeg";
					$userId=$_SESSION["isim"];
					$user=$_SESSION["isim"];
					$servername = "localhost";
					$username2 = "root";
					$pass="uxVa6ZDrOh";
					$dbname = "proje";
					$conn = new mysqli($servername, $username2,$pass, $dbname);
						if(! $conn )
						{
							die('Could not connect: ' . mysql_error() );
						}
					$sql = "UPDATE picture SET userPic='$userPic' where user='$userId'";
						if( $conn->query($sql)){
						} else {
								echo "Error: " . $sql . "<br>" . $conn->error;
							}
					$sql = "UPDATE user SET size=0 where userName='$userId'";
						if( $conn->query($sql)){
							include ('newpage.php');
						} else {
								echo "Error: " . $sql . "<br>" . $conn->error;
							}
					//$conn->close();
		}else{
			echo "olmadi";
		}
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}



?>