#http://blog.jeroenpelgrims.be/jquery-scroll-to-element-plugin/

require ['jquery'], ($) ->
  $.fn.scrollTo = (duration) ->
    duration ?= 1000

    topOffset = Math.abs(Math.round($(@).offset().top))

    $('html').animate(
      (scrollTop: topOffset),
      duration)