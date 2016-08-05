<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style> 
.row  {
    border-radius: 15%;
	margin-top: 3%;
    background: salmon;
    padding: 2%; 
    width: 35%;
    height: 70%; 
	text-align: center;
}
img.resize{
   max-width:50%;
   max-height:50%;
}

.cont{
    
        background-color: #3B3738;
        background-attachment: fixed;
        background-size: cover;
        height: 93%;
    
}    
html, body{
 height: 100%;
    
}        
.ul{
    
margin-top: 30%;    
}
*,
*:after,
*:before {
  box-sizing: inherit;
}


.loader {
  width: 250px;
  height: 50px;
  position: absolute;
  top: 90%;
  left: 50%;
  margin: -25px -125px;
  list-style-type: none;
}

.loader li {
  float: left;
  position: relative;
}

.circle {
  width: 40px;
  height: 40px;
  border-radius: 0 0 50% 50%;
  border: 4px solid #FF3E3E;
  border-top: 0;
  border-left: 0;
  border-right: 0;
}

.ball {
  position: absolute;
  content: "";
  width: 20px;
  height: 20px;
  top: 50%;
  left: 50%;
  margin-top: -10px;
  margin-left: -10px;
  border-radius: 100%;
  background: #FF3E3E;
  box-shadow: 0 -15px 0 0 rgba(255, 255, 255, 0.15), 0 -10px 0 0 rgba(255, 255, 255, 0.10), 0 -5px 0 0 rgba(255, 255, 255, 0.05);
}

.circle {
  -webkit-animation: rotate 1.5s cubic-bezier(0.45, 0, 1, 1) infinite;
  animation: rotate 1.5s cubic-bezier(0.45, 0, 1, 1) infinite;
}

.ball {
  -webkit-animation: fall 1.5s cubic-bezier(0.95, 0, 1, 1) infinite;
  animation: fall 1.5s cubic-bezier(0.95, 0, 1, 1) infinite;
}

.loader li:nth-child(1) div {
  -webkit-animation-delay: 100ms;
  animation-delay: 100ms;
}

.loader li:nth-child(2) div {
  -webkit-animation-delay: 200ms;
  animation-delay: 200ms;
}

.loader li:nth-child(3) div {
  -webkit-animation-delay: 300ms;
  animation-delay: 300ms;
}

.loader li:nth-child(4) div {
  -webkit-animation-delay: 400ms;
  animation-delay: 400ms;
}

.loader li:nth-child(5) div {
  -webkit-animation-delay: 500ms;
  animation-delay: 500ms;
}

@keyframes rotate {
  0%, 20% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@-webkit-keyframes rotate {
  0%, 20% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}

@keyframes fall {
  0%, 20% {
    -webkit-transform: translatey(-30px);
            transform: translatey(-30px);
    opacity: 0;
  }
  20%,
  24%,
  27%,
  30%,
  50%,
  75% {
    -webkit-transform: translatey(0px);
            transform: translatey(0px);
    opacity: 1;
  }
  22% {
    -webkit-transform: translatey(-10px);
            transform: translatey(-10px)
  }
  25% {
    -webkit-transform: translatey(-6px);
            transform: translatey(-6px)
  }
  28% {
    -webkit-transform: translatey(-2px);
            transform: translatey(-2px)
  }
  30% {
    box-shadow: 0px 0px 0px rgba(255, 255, 255, 0.3);
  }
  75%,
  100% {
    box-shadow: 0 -15px 0 0 rgba(255, 255, 255, 0.15), 0 -10px 0 0 rgba(255, 255, 255, 0.10), 0 -5px 0 0 rgba(255, 255, 255, 0.05);
    -webkit-transform: translatey(30px);
            transform: translatey(30px);
    opacity: 0;
  }
}

@-webkit-keyframes fall {
  0%, 20% {
    -webkit-transform: translatey(-30px);
    opacity: 0;
  }
  20%,
  24%,
  27%,
  30%,
  50%,
  75% {
    -webkit-transform: translatey(0px);
    opacity: 1;
  }
  22% {
    -webkit-transform: translatey(-10px)
  }
  25% {
    -webkit-transform: translatey(-6px)
  }
  28% {
    -webkit-transform: translatey(-2px)
  }
  30% {
    box-shadow: 0px 0px 0px rgba(255, 255, 255, 0.3);
  }
  75%,
  100% {
    box-shadow: 0 -15px 0 0 rgba(255, 255, 255, 0.15), 0 -10px 0 0 rgba(255, 255, 255, 0.10), 0 -5px 0 0 rgba(255, 255, 255, 0.05);
    -webkit-transform: translatey(30px);
    opacity: 0;
  }
}

</style>
    <title>E-Gozluk</title>
  </head>

  <body onload="lose()">
      <?php
	  session_start();
	   if(empty($_SESSION['isim'])){
		        header("Location: index.html");
		        die("Redirecting to index.html"); 
		    }
	$user=$_SESSION["isim"];
	$servername = "localhost";
	$username2 = "root";
	$dbname = "proje";
	$pass = "uxVa6ZDrOh";

	
	$con = new mysqli($servername, $username2, $pass, $dbname);
		if(! $con )
		{
			die('Could not connect: ' . mysql_error() );
		}
		
	$sql = "SELECT userPic FROM picture where user='$user'";
	
	$result = $con->query($sql);
	
	if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
		$pic=$row["userPic"];
	} 
	}
	$con->close();
	?>
            <div class="nav" align="center" style="height: 7%;">
                <ul class="nav nav-tabs nav-justified">
                    <li ><a href="#">Upload</a></li>
					<li ><a href="./logout.php">Logout</a></li>
                </ul>
        </div>
<div class="cont">
    <div class="container" align="center">
      <div class="row">
		<form action="./upload.php" method="post" enctype="multipart/form-data" onsubmit="return cont()">
    
    <div class="form-group" align="center">
        <img src="./egozluk.png" class="resize" alt="logo"> 
       	<br />
	    <br />
        <img  src="<?php echo htmlspecialchars($pic); ?>" alt="resim" height="150px" width="150px">
    </div>	

    <div class="form-group" align="center">
        
        <input id="image" type="file" name="fileToUpload" id="fileToUpload">
    </div>
    <div class="form-group">      
         <input type="submit" value="Upload Image" name="submit" onclick="lo()">
    </div>
	</form>
	
	<form action="./np.php" method="post" onsubmit="return fuc();">
        <br />
        <br />
        <br />
        <br />

    <div class="form-group">      
        <button type="submit" name="submit" onclick="load()">Show Glasses</button>     
<ul class="loader" id="loader">
  <li>
    <div class="circle"></div>
    <div class="ball"></div>
  </li>
  <li>
    <div class="circle"></div>
    <div class="ball"></div>
  </li>
  <li>
    <div class="circle"></div>
    <div class="ball"></div>
  </li>
  <li>
    <div class="circle"></div>
    <div class="ball"></div>
  </li>
  <li>
    <div class="circle"></div>
    <div class="ball"></div>
  </li>
</ul>       
    </div>
	</form>
</div>
</div>
</div>




<script type="text/javascript">

var x= "<?php echo $pic; ?>";
    
    function lose(){
      document.getElementById("loader").style.visibility = "hidden";   
        
    }
    function load(){
      
      document.getElementById("loader").style.visibility = "visible";  
    }

function fuc(){

	if( x == "uploads/def.jpeg"){
		alert("resim seciniz!");
		return false;
	}else{
		return true;
	}
}

function cont() {
	location.reload();	
		if(document.getElementById("fileToUpload").value == 0){
			alert("Resim Seciniz");
			return false;
			}else{
				return true;
			}

}

</script>
</body>
</html>
