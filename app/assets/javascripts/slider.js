$(document).on('turbolinks:load', function(){
  $('.slideshow').each(function(){
    let $slides = $(this).find('.slider-image'),
        slideCount = $slides.length,
        currentIndex = 0;
    $slides.eq(currentIndex).fadeIn();
    setInterval(showNextSlide, 7500);
    
    function showNextSlide(){
      let nextIndex = (currentIndex+1) % slideCount;
      $slides.eq(currentIndex).fadeOut();
      $slides.eq(nextIndex).fadeIn();
      
      
      currentIndex = nextIndex;
    }
  });
});