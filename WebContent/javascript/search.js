/**
 * 
 */


$(document).ready(function(){
  $("#tableInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#searchTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
