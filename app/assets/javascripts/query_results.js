$(document).ready(function () {
  $('.result-recipe').click(function(event) {
    $('.selected').removeClass("selected");
    $event = $(event.target);
    $event.closest('.result-recipe').toggleClass("selected");
    $('#claimed_dish_photo_url').val("potato");
  })

  //Populate form with information from selected div


  $(".owl-carousel").owlCarousel();
})