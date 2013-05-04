jQuery -> 
  banner = 0
  total = $("#banners .banner").length
  if total > 1
    nextBunner = ->
      banner += 1
      if banner == total
        banner = 0
        
      $("#banners .banner").hide()
      $("#banners .banner:eq(#{banner})").fadeIn(1000)
      setTimmer()
      
    setTimmer = ->
      setTimeout(nextBunner, 5000)
    
    setTimmer()