<?php
include("connection.inc.php");

$hospitalId = $_GET["hospitalId"];
$query = "SELECT ds.specialization_ID, s.Name FROM doctorsspecializations ds
          JOIN specializations s ON ds.specialization_ID = s.special_ID
          WHERE ds.user_ID IN (SELECT doctor_id FROM availability WHERE hosp_id = $hospitalId)";
$result = mysqli_query($conn, $query);

$options = "<option value=''>Select Specialization</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $options .= "<option value='{$row['specialization_ID']}'>{$row['Name']}</option>";
}

echo $options;
?>
