# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Paths
loadPath = (path) ->
  $.ajax
    url: Routes.path_path id: path.getAttribute('data-path')
    success: (data) ->
      document.querySelector("[data-path-target=#{path.getAttribute('data-path')}]").innerHTML = data
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
  paths = document.querySelector('.path.active').classList.remove('active')


# User
loadUser = ->
  $.ajax
    url: Routes.user_iframe_path()
    success: (data) ->
      document.querySelector('[data-user-target]').innerHTML = data
    error: ->
      document.querySelector('[data-user-target]').innerHTML = "Error"

setActiveUser = ->
  body = document.querySelector('body')
  if body.getAttribute('data-active-user') == 'on'
    body.setAttribute 'data-active-user', 'off'
  else
    body.setAttribute 'data-active-user', 'on'

listenUser = ->
  document.querySelector('[data-user]').addEventListener 'click', setActiveUser
  [].forEach.call document.querySelectorAll('[data-path]'), (path) ->
    path.addEventListener 'click', -> loadUser()



# Main
document.addEventListener 'DOMContentLoaded', ->
  setTimeout loadPaths, 1500 # Paths
  listenPaths setActivePath # Paths
