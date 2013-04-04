jQuery ->
  jQuery('#fileupload').fileupload
    start: (e, data) ->
      $('body').addClass('ajax-loading')
    stop: (e, data) ->
      $('body').removeClass('ajax-loading')
    fail: ->
      alert("I'm sorry. Your upload failed.", 'error')
