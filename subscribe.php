<?php
error_reporting(E_ERROR | E_PARSE);
$con= new mysqli('127.0.0.1', 'root', 'root', 'RecipesDB');
$con->set_charset("utf8");

$uname = $_GET['uname'];
$upw = $_GET['upw'];
$ugmail = $_GET['ugmail'];
$uage = $_GET['uage'];


$sql = "INSERT INTO UsersTemp(username, password,email,age) VALUES('" . $uname . "','" . $upw . "','" . $ugmail . "'," . $uage . ");" ;


try{
	$result = $con->query($sql);
	echo "<h5>Thank you for choosing us. Starting from tomorrow, you will get our daily mails.</h5>";
}
catch(PDOException $e){
	echo "Not inserted";

}
?>
