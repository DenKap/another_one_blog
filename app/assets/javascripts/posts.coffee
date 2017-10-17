ready = ->
  $("#add-more-files").click (e) ->
    e.preventDefault()
    $(".post-files").append('<p><input type="file" name="post_files[]"></p>')

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('turbolinks:load', ready);