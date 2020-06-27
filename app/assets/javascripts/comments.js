//無限スクロール
$(document).on("turbolinks:load", function() {
  $('.comment-container').infiniteScroll({
    append : '.comment-container .comment-wrapper',
    history: false,
    scrollThreshold: true,
    path : 'nav ul.pagination a[rel=next]',
    hideNav: 'nav ul.pagination',
    status: '.page-load-status'
  });
});