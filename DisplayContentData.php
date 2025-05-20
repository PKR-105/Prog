<?php

$url=$_SERVER['REQUEST_URI'];

header("Refresh: 11; URL=$url");

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

include('ConnDtbs.php');

$result1 = mysqli_query($conc,'SELECT * FROM evs ORDER BY id DESC');

$oddrow1 = true;

while($rw1 = mysqli_fetch_array($result1))	
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

echo "<td '.$css_class.'>" . $rw1['id'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['event'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['temp'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['hum'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['lpg'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['smoke'] . "</td>";

echo "<td '.$css_class.'>" . $rw1['flamesense'] . "</td>";

echo "</tr>"; 

} 

mysqli_close($conc);

?>

</table>

</body>

</html>