/**
 * 
 */

$(document).ready(function(){
  $("#leavedetailsInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#leavedetailsTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
