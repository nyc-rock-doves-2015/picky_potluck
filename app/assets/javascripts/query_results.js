$(document).ready(function () {
  $('.result-recipe').click(function(event) {
    $event = $(event.target);
    $event.closest('.result-recipe').toggleClass("selected");

    // change the background color of this recipe's .result-recipe div.
    // when submit button is clicked, it creates a claimeddish with the correct information.
  })

  //Unselect other divs when one is selected
  //Populate form with information from selected div


  $(".owl-carousel").owlCarousel();
})