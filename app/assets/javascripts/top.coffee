# Clock
updateClock = ->
  date = new Date
  formatted_hours = ("0" + date.getHours()).slice -2
  formatted_minutes = ("0" + date.getMinutes()).slice -2
  $("#clock").text "#{formatted_hours}:#{formatted_minutes}"

loopClock = ->
  setInterval updateClock, 60 * 1000

launchClock = ->
  date = new Date
  interval = (60 - date.getSeconds()) * 1000
  updateClock()
  setTimeout updateClock, interval
  setTimeout loopClock, interval


# Main
document.addEventListener 'DOMContentLoaded', ->
  launchClock() # Clock
