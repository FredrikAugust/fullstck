$(document).on 'turbolinks:load', ->
  $('.parallax').parallax()
  $('.button-collapse').sideNav
    closeOnClick: true
  $('.carousel.carousel-slider').carousel
    full_width: true
    indicators: true
  $(window).on 'scroll', (e) ->
    # when the top of the window is at the same place as the top of the second nav
    if $(window).scrollTop() >= $('#navsep').offset().top
      # add original background-color and box-shadow
      $('#navigation').removeClass('trans-nav').addClass('vis-nav')
    else
      # remove background-color and box-shadow
      $('#navigation').removeClass('vis-nav').addClass('trans-nav')

  # smooth scrolling
  $('a[href^="#"]').on 'click', (e) ->
    e.preventDefault()

    $target = $($(this).attr('href'))

    $('html, body').stop().animate {
      'scrollTop': $target.offset().top - $('#navigation').height()
    }, 500, 'swing'

$(window).on 'load', ->
  $('.carousel').height($('.carousel').height()*0.70)

