$(document).ready(function () {
  $('.result-recipe').click(function(event) {
    $event = $(event.target);
    $event.closest('.result-recipe').toggleClass("selected");
    // change the background color of this recipe's .result-recipe div.
    // when submit button is clicked, it creates a claimeddish with the correct information.
  })

  $('#claim-button').on("click", function(event){
      console.log("potatoes")
      event.preventDefault();
  })
  $(".owl-carousel").owlCarousel();
})