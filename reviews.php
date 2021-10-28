<?php
error_reporting(E_ERROR | E_PARSE);
$con= new mysqli('127.0.0.1', 'root', 'root', 'RecipesDB');
$con->set_charset("utf8");

$rid = $_GET['rid'];

$sql = "SELECT * FROM Reviews where rid = $rid ;";

$result = $con->query($sql);
$reviews = "";
if( $result->num_rows > 0 ){

        while ($row = $result->fetch_assoc()) {
                $reviews .= $row['username'] . "~" . $row['review'] . ";";
        }
}

echo $reviews;
?>

