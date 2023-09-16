<?php
    include("connection.inc.php");
    $query = "SELECT * FROM `cities`";
    $result = mysqli_query($conn, $query);    
?>
<!DOCTYPE html>
<html>
<head>
    <title>Healthcare System</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form>
        <label for="city">Select City:</label>
        <select id="city" name="city">
            <option value="">Select City</option>
            <?php 
                while($rows = mysqli_fetch_assoc($result)){
                echo '<option value="'.$rows['id'].'">'.$rows['name'].'</option>';
            ?>
            <!-- PHP code to fetch and populate city options -->
            <?php
                }
            ?>
        </select>

        <label for="hospital">Select Hospital:</label>
        <select id="hospital" name="hospital" disabled>
            <option value="">Select Hospital</option>
            <!-- Options will be populated dynamically using jQuery -->
        </select>

        <label for="specialization">Select Specialization:</label>
        <select id="specialization" name="specialization" disabled>
            <option value="">Select Specialization</option>
            <!-- Options will be populated dynamically using jQuery -->
        </select>

        <label for="doctor">Select Doctor:</label>
        <select id="doctor" name="doctor" disabled>
            <option value="">Select Doctor</option>
            <!-- Options will be populated dynamically using jQuery -->
        </select>
    </form>

    <script>
        $(document).ready(function () {
            $("#city").change(function () {
                var cityId = $(this).val();
                if (cityId !== "") {
                    // Fetch hospitals based on selected city
                    $.get("get_hospitals.php", { cityId: cityId }, function (data) {
                        $("#hospital").html(data).prop("disabled", false);
                    });
                } else {
                    $("#hospital").html("<option value=''>Select Hospital</option>").prop("disabled", true);
                    $("#specialization").html("<option value=''>Select Specialization</option>").prop("disabled", true);
                    $("#doctor").html("<option value=''>Select Doctor</option>").prop("disabled", true);
                }
            });

            $("#hospital").change(function () {
                var hospitalId = $(this).val();
                if (hospitalId !== "") {
                    // Fetch specializations based on selected hospital
                    $.get("get_specializations.php", { hospitalId: hospitalId }, function (data) {
                        $("#specialization").html(data).prop("disabled", false);
                    });
                } else {
                    $("#specialization").html("<option value=''>Select Specialization</option>").prop("disabled", true);
                    $("#doctor").html("<option value=''>Select Doctor</option>").prop("disabled", true);
                }
            });

            $("#specialization").change(function () {
                var specializationId = $(this).val();
                var hospitalId = $('#hospital').val();
                var cityId = $('#city').val();                
                if (specializationId !== "") {
                    // Fetch doctors based on selected specialization
                    $.get("get_doctors.php", { specializationId: specializationId,hospitalId: hospitalId,cityId: cityId }, function (data) {
                        $("#doctor").html(data).prop("disabled", false);
                    });
                } else {
                    $("#doctor").html("<option value=''>Select Doctor</option>").prop("disabled", true);
                }
            });
        });
    </script>
</body>
</html>
