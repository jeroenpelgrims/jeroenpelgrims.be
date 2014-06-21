#http://blog.jeroenpelgrims.be/jquery-scroll-to-element-plugin/

require ['jquery'], ($) ->
  $.fn.scrollTo = (duration) ->
    duration ?= 1000

    offset = $(@).offset().top - $(window).height()/2 + $(@).height()

    $('html,body').animate({
      scrollTop: offset
    }, duration)