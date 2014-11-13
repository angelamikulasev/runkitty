document.addEventListener "DOMContentLoaded", (event) ->
  catWalk = new CatWalk("cat", "start", "go-faster", "stop") # new undefined object
  return

CatWalk = (catId, startId, goFasterId, stopId) ->
  @speed = 0
  @imageEl = document.getElementById(catId)
  startEl = document.getElementById(startId)
  goFasterEl = document.getElementById(goFasterId)
  stopEl = document.getElementById(stopId)
  
  #speed for buttons
  @onStart = ->
    @speed = 5
    return

  @onGoFaster = ->
    if @speed > 0
      @speed += 10
    else
      @speed -= 10
    return

  @onStop = ->
    @speed = 0
    return
    
  # addEventListener attaches an event handler to the document
  startEl.addEventListener "click", @onStart.bind(this)
  goFasterEl.addEventListener "click", @onGoFaster.bind(this)
  stopEl.addEventListener "click", @onStop.bind(this)
  
  # flip image
  @walk = ->
    currentLeft = parseInt(@imageEl.style.left) or 0
    currentRight = currentLeft + 296
    if currentRight >= window.innerWidth
      @speed *= -1
      @imageEl.className = "walk-left" # link to flip style
    else if currentLeft < 0
      @speed *= -1
      @imageEl.className = "walk-right"
    newLeft = currentLeft + @speed
    @imageEl.style.left = newLeft + "px"
    return

  setInterval @walk.bind(this), 100 #setInterval() method calls a function or evaluates an expression at specified intervals(ms)
  return
