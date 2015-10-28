# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# User
loadUser = ->
  $.ajax
    url: Routes.user_path()
    success: (data) ->
      document.querySelector('[data-user-target]').innerHTML = data
      listenLogin() # Login
      listenLogout() # Logout
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

loginClickHandler = (btn, event) ->
  event.preventDefault()
  setLogin(btn)
  body = document.querySelector('body')
  $.ajax
    url: Routes.auth_init_path()
    data:
      active_path: body.getAttribute 'data-active-path'
      active_player: body.getAttribute 'data-active-player'
      active_user: body.getAttribute 'data-active-user'
      select_path: body.getAttribute 'data-select-path'
      select_player: body.getAttribute 'data-select-player'
    method: 'post'
    complete: (data) ->
      btn.removeEventListener 'click', btn.clickHandler
      btn.click()

listenLogin = ->
  [].forEach.call document.querySelectorAll('.login-btn'), (btn) ->
    btn.clickHandler = (event) -> loginClickHandler(btn, event)
    btn.addEventListener 'click', btn.clickHandler


#Logout
logout = ->
  $.ajax
    url: Routes.signout_path()
    success: (data) ->
      document.querySelector('[data-user-target]').innerHTML = data
      listenLogin() # Login
      listenLogout() # Logout
    error: ->
      document.querySelector('[data-user-target]').innerHTML = "Error"

listenLogout = ->
  btn = document.querySelector('#signout-btn')
  if btn
    btn.addEventListener 'click', logout


# Main
document.addEventListener 'DOMContentLoaded', ->
  body = document.querySelector('body')
  if body.getAttribute('data-document') == 'auth-redirection'
    loadUser() # User
  else
    setTimeout loadUser, 2500 # User

  listenUser() # User
