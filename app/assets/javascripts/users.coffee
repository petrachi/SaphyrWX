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
  [].forEach.call document.querySelectorAll('[data-path]'), (path) ->
    path.addEventListener 'click', loadUser


# Login
setLogin = (btn) ->
  btn.classList.add 'logging'
  document.querySelector('#user-profile').classList.add 'logging'

listenLogin = ->
  console.log('ll')
  [].forEach.call document.querySelectorAll('.login_btn'), (btn) ->
    btn.addEventListener 'click', -> setLogin(btn)

# Main
document.addEventListener 'DOMContentLoaded', ->
  console.log('user')
  listenUser() # User
  listenLogin() # Login
