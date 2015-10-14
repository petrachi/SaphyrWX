# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Video
loadVideo = (video) ->
  $.ajax
    url: Routes.video_path id: video.getAttribute('data-video')
    success: (data) ->
      document.querySelector('[data-video-target]').innerHTML = data
    error: ->
      document.querySelector('[data-video-target]').innerHTML = "Error"
    complete: ->
      document.querySelector('body').setAttribute 'data-active-user', 'on'

listenVideo = (path) ->
  [].forEach.call document.querySelectorAll("[data-path-target=#{path.getAttribute('data-path')}] .video"), (video) ->
    btn.addEventListener 'click', -> loadVideo(video)
