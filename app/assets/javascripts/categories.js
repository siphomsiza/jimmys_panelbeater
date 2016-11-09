$(document).ready(function() {
  var colours = $("[data-folder-colours]").val();
  $(document).on("change", "#documents_category_colour", function(){
    console.log("changing colour");
    $('#doc-theme-preview')
    .removeClass(colours)
    .addClass($(this).val());
  });
  $('#documents_category_colour').change();
});
