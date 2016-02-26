$(document).ready(function(){
  $(".animsition").animsition({

  });

    $('.your-class').slick({
  autoplay: true,
  autoplaySpeed: 3000,
  centerMode: true,
  variableWidth: true
  });

    $('.developer-showcase').slick({
    dots: true,
     autoplay: true,
  autoplaySpeed: 2000,
   infinite: true,
  slidesToShow: 3,
  slidesToScroll: 1
})

$('.projects-container').slick({
    dots: true,
     autoplay: true,
  autoplaySpeed: 2000,
   infinite: true,
  slidesToShow: 3,
  slidesToScroll: 1
})

$('.business-images').slick({
    // dots: true,

     centerMode: true,
  centerPadding: '60px',
  slidesToShow: 3,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
})
})
