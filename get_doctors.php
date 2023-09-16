<?php
include("connection.inc.php"); // Include your database connection file

$specializationId = $_GET["specializationId"];
$hospitalId = $_GET["hospitalId"];
$cityId = $_GET["cityId"];
$query = "SELECT DISTINCT u.ID, CONCAT(u.FirstName, ' ', u.LastName) AS DoctorName FROM users u
            INNER JOIN doctorsspecializations AS ds ON u.ID = ds.user_ID
            INNER JOIN availability AS a ON u.ID = a.doctor_id
            INNER JOIN hospitals AS h ON a.hosp_id = h.hospital_id
            WHERE h.City_ID = $cityId
            AND h.hospital_id = $hospitalId
            AND ds.specialization_ID = $specializationId";
$result = mysqli_query($conn, $query);

$options = "<option value=''>Select Doctor</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $options .= "<option value='{$row['ID']}'>{$row['DoctorName']}</option>";
}

echo $options;
?>
