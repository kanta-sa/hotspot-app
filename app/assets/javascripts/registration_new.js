$(document).ready(function(){
  wsize = $(window).width();
  if (wsize < 1000){
    $(".registrations-new-wrapper .left").css("height", wsize*0.45 + "px");
  }
  else{
    $(".registrations-new-wrapper .left").css("height", wsize*0.24 + "px");
  }
});

$(window).resize(function(){
  wsize = $(window).width();
  if (wsize < 1000){
    $(".registrations-new-wrapper .left").css("height", wsize*0.45 + "px");
  }
  else{
    $(".registrations-new-wrapper .left").css("height", wsize*0.24 + "px");
  }
})