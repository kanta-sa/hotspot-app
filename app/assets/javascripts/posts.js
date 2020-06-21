$(document).on('change', '#post_prefecture_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/posts/cities_select',
    data: {
      prefecture_id: $(this).val()
    }
  }).done(function(data) {
    return $('#cities_select').html(data);
  });
});