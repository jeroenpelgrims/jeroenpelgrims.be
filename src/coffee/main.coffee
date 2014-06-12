require [
  'bootstrap'
], ->
  $(->
    navbar = $('nav[data-spy="affix"]')
    navbar.affix
      offset:
        top: 350
        bottom: ->
          return (@bottom = $('.footer').outerHeight(true))
  )