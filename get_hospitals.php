<?php
include("connection.inc.php");

$cityId = $_GET["cityId"];
$query = "SELECT hospital_id, Name FROM hospitals WHERE City_ID = $cityId";
$result = mysqli_query($conn, $query);

$options = "<option value=''>Select Hospital</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $options .= "<option value='{$row['hospital_id']}'>{$row['Name']}</option>";
}

echo $options;
?>
