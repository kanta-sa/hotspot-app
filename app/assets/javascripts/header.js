$(document).on("turbolinks:load",function(){
  let duration = 300;
  
  let $button = $('#menu-bar');
  let $aside = $('aside');
  let $fadelayer = $('#fadelayer');
  
  $(document).on('click', function(event){
    let $click = $(event.target);
    if($click.closest($button).length && !$aside.hasClass('open')){
      $aside.addClass('open');
      $fadelayer.css('visibility', 'visible');
      $aside.stop(true).animate({
        left: 0
      }, duration);
    }
    else if(!$click.closest($aside).length && $aside.hasClass('open')){
      $aside.removeClass('open');
      $fadelayer.css('visibility', '');
      $aside.stop(true).animate({
        left: '-35%'
      }, duration);
    };
  });
});