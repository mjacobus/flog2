jQuery ->
  updatePictureOrders = ->
    ids = []
    $('#pictures li').each ->
        ids.push $(this).data('id')

    $.ajax
      url: window.location.href + '/reorder_pictures'
      type: 'POST'
      dataType: 'script'
      data: { picture_ids: ids }
        
    

  $('#pictures').sortable
    update: (event, ui) ->
      updatePictureOrders()
      