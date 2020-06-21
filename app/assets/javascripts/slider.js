$(document).on('turbolinks:load', function(){
  $('.slideshow').each(function(){
    let $slides = $(this).find('.slider-image'),
        $texts = $(this).find('.slider-text'),
        slideCount = $slides.length,
        currentIndex = 0;
    $slides.eq(currentIndex).fadeIn();
    $texts.eq(currentIndex).fadeIn();
    setInterval(showNextSlide, 7500);
    
    function showNextSlide(){
      let nextIndex = (currentIndex+1) % slideCount;
      $slides.eq(currentIndex).fadeOut(500);
      $texts.eq(currentIndex).fadeOut(500);
      $slides.eq(nextIndex).fadeIn(3000);
      $texts.eq(nextIndex).fadeIn(3000);
      
      currentIndex = nextIndex;
    }
  });
});