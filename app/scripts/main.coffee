# jQuery to collapse the navbar on scroll
# $(window).scroll ->
#   if $('.navbar').offset().top > 250
#     $('.navbar-brand.hidden-xs').removeClass 'navbar-brand-scroll-disable'
#     # $('.navbar-custom ul > li:first-child').removeClass 'navbar-brand-scroll-disable'
#   else
#     $('.navbar-brand.hidden-xs').addClass 'navbar-brand-scroll-disable'
#     # $('.navbar-custom ul > li:first-child').addClass 'navbar-brand-scroll-disable'
#   return
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


$(".pic-me").mouseover (e)->
	$(e.currentTarget).find("img.orig").css("height",$(e.currentTarget).find("img.graphic").outerHeight(true))
	return
.mouseout (e) ->
	$(e.currentTarget).find("img.orig").css("height", $(e.currentTarget).find("img.graphic").outerHeight(true))
	return 
