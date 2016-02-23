$(document).ready(function(){
  $(".animsition").animsition({
    inClass: 'fade-in-up',
    outClass: 'fade-out-right-lg',
    linkElement: 'a',
    inDuration: 1000,
    outDuration: 500
  });

    $('.your-class').slick({
  autoplay: true,
  autoplaySpeed: 2000,
  centerMode: true,
  variableWidth: true
  });



})
