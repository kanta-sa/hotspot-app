$(document).ready(function(){
  let wsize = $(window).width();
  $(".post-detail-container .post-image-wrapper").css("height", wsize*0.6*0.5*0.7+"px");
});

$(window).resize(function(){
  let wsize = $(window).width();
  $(".post-detail-container .post-image-wrapper").css("height", wsize*0.6*0.5*0.7+"px");
});