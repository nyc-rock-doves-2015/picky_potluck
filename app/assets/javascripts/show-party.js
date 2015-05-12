$(document).ready(function(){
  $('.new_rsvp select').on('change', function(event){
    event.preventDefault();

    $form = $(event.target).closest('.new_rsvp');

    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    }).then(function(response){
      $otherForms = $(".new_rsvp");

      for (var i=0; i<$otherForms.length; i ++){
        if ($form.attr('action') === $($otherForms[i]).attr('action')){
          $($otherForms[i]).find('select').val(response);
        }
      }
    });

  });

});