$(document).ready(function(){
  $('select').on('change', function(event){
    console.log("yo");
    $(event.target).closest('form').submit();
  });
});