$(document).ready(function() {
  $("#city").on("change", function() {
    var cityId = $(this).val();
    if (cityId) {
      $.ajax({
        url: "fetch_hospitals.php",
        type: "POST",
        data: { city_id: cityId },
        success: function(data) {
          $("#hospital").html(data).prop("disabled", false);
          $("#specialization").html("<option value=''>Select specialization</option>").prop("disabled", true);
          $("#doctor").html("<option value=''>Select doctor</option>").prop("disabled", true);
        }
      });
    } else {
      $("#hospital").html("<option value=''>Select hospital</option>").prop("disabled", true);
      $("#specialization").html("<option value=''>Select specialization</option>").prop("disabled", true);
      $("#doctor").html("<option value=''>Select doctor</option>").prop("disabled", true);
    }
  });

  $("#hospital").on("change", function() {
    var hospitalId = $(this).val();
    if (hospitalId) {
      $.ajax({
        url: "fetch_specializations.php",
        type: "POST",
        data: { hospital_id: hospitalId },
        success: function(data) {
          $("#specialization").html(data).prop("disabled", false);
          $("#doctor").html("<option value=''>Select doctor</option>").prop("disabled", true);
        }
      });
    } else {
      $("#specialization").html("<option value=''>Select specialization</option>").prop("disabled", true);
      $("#doctor").html("<option value=''>Select doctor</option>").prop("disabled", true);
    }
  });

  $("#specialization").on("change", function() {
    var hospitalId = $("#hospital").val();
    var specializationId = $(this).val();
    if (hospitalId && specializationId) {
      $.ajax({
        url: "fetch_doctors.php",
        type: "POST",
        data: { hospital_id: hospitalId, specialization_id: specializationId },
        success: function(data) {
          $("#doctor").html(data).prop("disabled", false);
        }
      });
    } else {
      $("#doctor").html("<option value=''>Select doctor</option>").prop("disabled", true);
    }
  });
});
