require [
  'bootstrap'
], ->
  #Adds the `affix` class to the navbar after a certain scroll treshold

  navbar = $('nav[data-spy="affix"]')
  navbar.affix
    offset:
      top: 350
      bottom: ->
        return (@bottom = $('.footer').outerHeight(true))