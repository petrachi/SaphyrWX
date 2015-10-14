# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
  [].forEach.call document.querySelectorAll('[data-user]'), (user) ->
    user.addEventListener 'click', setActiveUser


# Login
setLogin = (btn) ->
  btn.classList.add 'logging'
  document.querySelector('#user-profile').classList.add 'logging'

listenLogin = ->
  [].forEach.call document.querySelectorAll('.login_btn'), (btn) ->
    btn.addEventListener 'click', -> setLogin(btn)

# Main
document.addEventListener 'DOMContentLoaded', ->
  setTimeout listenUser, 2000 # User
  setTimeout loadUser, 2500 # User
  setTimeout listenLogin, 2000 # Login
