# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Playlist
syncPlaylist = (playlist) ->
  $.ajax
    url: Routes.sync_playlist_path id: playlist.getAttribute('data-playlist')
    success: (data) ->
      document.querySelector("[data-playlist-target=#{playlist.getAttribute('data-playlist')}]").innerHTML = "<center>Sync OK</center>"
    error: ->
      document.querySelector("[data-playlist-target=#{playlist.getAttribute('data-playlist')}]").innerHTML = "Error"

listenPlaylist = ->
  [].forEach.call document.querySelectorAll('[data-playlist]:not([data-video])'), (playlist) ->
    playlist.addEventListener 'click', -> syncPlaylist(playlist)


# Video
syncVideo = (video) ->
  $.ajax
    url: Routes.sync_video_path id: video.getAttribute('data-video')
    data: playlist_id: video.getAttribute('data-playlist')
    success: (data) ->
      document.querySelector("[data-video-target=#{video.getAttribute('data-video')}]").innerHTML = "<center>Sync OK</center>"
    error: ->
      document.querySelector("[data-video-target=#{video.getAttribute('data-video')}]").innerHTML = "Error"

listenVideo = ->
  [].forEach.call document.querySelectorAll('[data-video]'), (video) ->
    video.addEventListener 'click', -> syncVideo(video)



# Main
document.addEventListener 'DOMContentLoaded', ->
  listenPlaylist() # Playlist
  listenVideo() # Video
