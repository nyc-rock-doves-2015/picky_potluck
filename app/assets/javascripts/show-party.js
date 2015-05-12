$(document).ready(function(){
  $('select').on('change', function(event){
    event.preventDefault();
    $form = $(event.target).closest('.new_rsvp');
    // debugger
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    }).then(function(response){
      $("select").val(response);
    });
  });
});