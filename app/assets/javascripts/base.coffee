# Main
document.addEventListener 'DOMContentLoaded', ->
  setTimeout ->
    document.querySelector('body').setAttribute 'data-document', 'load'
  , 500
