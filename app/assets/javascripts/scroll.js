$(document).on('turbolinks:load', function() {

  $('.jscroll').jscroll({
    contentSelector: '.jscroll',
    nextSelector: 'span.next:last a',
  });

});