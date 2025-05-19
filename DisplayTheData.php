<?php

$url=$_SERVER['REQUEST_URI'];

header("Refresh: 10; URL=$url");

?>

<html>

<head>

<title>IoT base Environment Monitoring System</title>

<style type="text/css">

.table_titles {
	
padding-right: 20px;

padding-left: 20px;

color: #000;

}

.table_titles {
	
color: #FFF;

background-color: #8A2BE2;

}

table {
	
border: 2px solid #333;

}

body { 

font-family: "Trebuchet MS", Courier; 

}

</style>

</head>

<body>

<h1>Data Logging</h1>

<table border="0" cellspacing="0" cellpadding="4">

<tr>

<td class="table_titles">Index</td>

<td class="table_titles">Date & Timing</td>

<td class="table_titles">Temp(C)</td>

<td class="table_titles">Humidity</td>

<td class="table_titles">LPG</td>

<td class="table_titles">Smoke</td>

<td class="table_titles">Flames</td>

</tr>

<?php

include('ConnectDatabase1.php');

$result1 = mysqli_query($con,'SELECT * FROM envmonitor1p2 ORDER BY id DESC');

// Process every record
$oddrow1 = true;

while($row1 = mysqli_fetch_array($result1))	
{
	
if ($oddrow1)	
{
	
$css_class=' class="table_cells_odd"';

}

else	
{
	
$css_class=' class="table_cells_even"';

}

$oddrow1 = !$oddrow1;

echo "<tr>";

echo "<td '.$css_class.'>" . $row1['id'] . "</td>";

echo "<td '.$css_class.'>" . $row1['event'] . "</td>";

echo "<td '.$css_class.'>" . $row1['temp'] . "</td>";

echo "<td '.$css_class.'>" . $row1['hum'] . "</td>";

echo "<td '.$css_class.'>" . $row1['lpg'] . "</td>";

echo "<td '.$css_class.'>" . $row1['smoke'] . "</td>";

echo "<td '.$css_class.'>" . $row1['flamesense'] . "</td>";

echo "</tr>"; 

} 

// Close the connection
mysqli_close($con);

?>

</table>

</body>

</html>