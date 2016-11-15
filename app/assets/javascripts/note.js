$(document).ready(function() {
    console.log("i am here now");
    $("input[name='note[color]']").change(function() {
       console.log("yes changed");
       $(".note-form").attr("class","note-form "+ $(this).val() + "")
    });
})
