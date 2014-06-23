unrotEmail = ->
  mailLink = $('a[href*="mailto:"]')
  email = (mailLink.attr('href').match /mailto:(.*)/)[1]
  mailLink.attr 'href', "mailto:#{email.rot18()}"
  mailLink.text email.rot18()

unrotPhone = ->
  phoneLink = $('a[href*="tel:"]')
  phone = (phoneLink.attr('href').match /tel:(.*)/)[1]
  phoneLink.attr 'href', "tel:#{phone.rot18().replace /\s+/g, ''}"
  phoneLink.text phone.rot18()

addScrollTo = ->
  # ($ 'a[href*=#]').click (e) ->
  #   e.preventDefault()
  #   target = ($ e.target).attr 'href'
  #   ($ target).scrollTo 500

  #   history.pushState {}, document.title, target

require [
  'bootstrap'
  './rot18'
  './navbar-affix',
  './scrollTo'
], ->

  unrotEmail()
  unrotPhone()
  addScrollTo()