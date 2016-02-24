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
  autoplaySpeed: 3500,
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
