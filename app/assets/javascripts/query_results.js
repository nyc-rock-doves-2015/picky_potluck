$(document).ready(function () {
  $('.result-recipe').click(function(event) {
    $('.selected').removeClass("selected");
    $event = $(event.target).closest('.result-recipe');
    $event.toggleClass("selected");
    $image_url = $event.find("img").attr("src");
    $('#claimed_dish_photo_url').val($image_url);
    $yummly_id = $event.find('a').attr('href').slice(29);
    $('#claimed_dish_yummly_id').val($yummly_id);
    $name = $event.find('a').html();
    $('#claimed_dish_name').val($name);
  });

  $(".owl-carousel").owlCarousel();
});