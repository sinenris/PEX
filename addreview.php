<?php
error_reporting(E_ERROR | E_PARSE);
$con= new mysqli('127.0.0.1', 'root', 'root', 'RecipesDB');
$con->set_charset("utf8");

$ridID = $_GET['ridID'];
$nickname = $_GET['nickname'];
$review = $_GET['review'];


$sql = "INSERT INTO Reviews(rid, username,review) VALUES('" . $ridID . "','" . $nickname . "','" . $review . "');" ;

#print($sql);
try{
	$result = $con->query($sql);
	echo "<h5>Your review has been added!</h5>";
}
catch(PDOException $e){
	echo "Not inserted";

}
?>
