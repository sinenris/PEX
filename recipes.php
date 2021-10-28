<table>
<tr><th>Name</th><th>Ingredients</th><th>Description</th><th>Duration</th></tr>
<?php
error_reporting(E_ERROR | E_PARSE);
$con= new mysqli('127.0.0.1', 'root', 'root', 'RecipesDB');
$con->set_charset("utf8");

$ing = $_GET['ingredients'];
$my_ingredients = explode(',', $ing);


$sql = "SELECT * FROM Recipes where ingredients like '%" . $my_ingredients[0] . "%'";


for ($i = 1; $i < count($my_ingredients); $i++){
	$sql .= " and ingredients like '%" . $my_ingredients[$i] . "%'";
}
print ($sql);
$result = $con->query($sql);
while ($row = $result->fetch_assoc()) {
 $name = $row['name'];
 $ingredients = $row['ingredients'];
 $description = $row['description'];
 $duration = $row['duration'];
 print
"\t<tr><td>$name</td><td>$ingredients</td><td>$description</td><td>$duration</td></tr>\n";
}
?>
</table>
