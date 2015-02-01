# jQuery to collapse the navbar on scroll
$(window).scroll ->
  if $('.navbar').offset().top > 250
    $('.navbar-fixed-top').addClass 'top-nav-collapse'
  else
    $('.navbar-fixed-top').removeClass 'top-nav-collapse'
  return
# jQuery for page scrolling feature - requires jQuery Easing plugin
$ ->
  $('a.page-scroll').bind 'click', (event) ->
    $anchor = $(this)
    $('html, body').stop().velocity 'scroll',
      offset: $($anchor.attr('href')).offset().top
      mobileHA: false
    event.preventDefault()
    return
  return
