# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Paths
loadPath = (path) ->
  $.ajax
    url: Routes.path_path id: path.getAttribute('data-path')
    success: (data) ->
      document.querySelector("[data-path-target=#{path.getAttribute('data-path')}]").innerHTML = data
      listenVideos(path) # Video
    error: ->
      path.innerHTML = "Error"

loadPaths = ->
  paths = document.querySelectorAll '[data-path]'
  [].forEach.call paths, (path) ->
    loadPath path

listenPaths = (callback) ->
  paths = document.querySelectorAll '[data-path]'
  [].forEach.call paths, (path) ->
    path.clickHandler = ->
      callback(path)
      clearListenPaths()
      listenActivePath()
    path.addEventListener 'click', path.clickHandler

listenActivePath = ->
  path = document.querySelector '.path.active [data-path]'
  path.clickHandler = ->
    document.querySelector('body').setAttribute 'data-select-path', 'on'
    clearListenPaths()
    listenSelectablePaths()
  path.addEventListener 'click', path.clickHandler

listenSelectablePaths = ->
  paths = document.querySelectorAll '[data-path]'
  [].forEach.call paths, (path) ->
    path.clickHandler = ->
      clearActivePath()
      setActivePath(path)
      document.querySelector('body').setAttribute 'data-select-path', 'off'
      listenActivePath()
    path.addEventListener 'click', path.clickHandler

clearListenPaths = ->
  paths = document.querySelectorAll '[data-path]'
  [].forEach.call paths, (path) ->
    path.removeEventListener 'click', path.clickHandler

setActivePath = (path) ->
  path.parentNode.parentNode.classList.add 'active' # reach the '.path' div
  document.querySelector('body').setAttribute 'data-active-path', path.getAttribute('data-path')

clearActivePath = ->
  document.querySelector('.path.active').classList.remove('active')


# Video
loadVideo = (video) ->
  $.ajax
    url: Routes.video_path id: video.getAttribute('data-video')
    success: (data) ->
      document.querySelector('[data-video-target]').innerHTML = data
    error: ->
      document.querySelector('[data-video-target]').innerHTML = "Error"
    complete: ->
      document.querySelector('body').setAttribute 'data-active-player', 'on'

listenVideos = (path) ->
  [].forEach.call document.querySelectorAll("[data-path-target=#{path.getAttribute('data-path')}] .video"), (video) ->
    video.addEventListener 'click', -> loadVideo(video)


# Player
listenPlayerBackBtn = ->
  unless document.querySelector('body').getAttribute('data-iframe')
    document.querySelector('#back-to-path').addEventListener 'click', backToPath

backToPath = ->
  document.querySelector('body').setAttribute 'data-active-player', 'off'
  setTimeout clearPlayer, 1000

clearPlayer = ->
  player = document.querySelector('#player')
  while player.hasChildNodes()
    player.removeChild(player.firstChild)


# Main
document.addEventListener 'DOMContentLoaded', ->
  setTimeout loadPaths, 1500 # Paths
  listenPaths setActivePath # Paths
  listenPlayerBackBtn() # Player
