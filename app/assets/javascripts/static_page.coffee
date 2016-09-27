$(document).on 'turbolinks:load', ->
  $('.parallax').parallax()
  $(".button-collapse").sideNav()
  $(window).on 'scroll', (e) ->
    # when the top of the window is at the same place as the top of the second nav
    if $(window).scrollTop() >= $('#navsep').offset().top
      # add original background-color and box-shadow
      $('#navigation').removeClass('trans-nav').addClass('vis-nav')
    else
      # remove background-color and box-shadow
      $('#navigation').removeClass('vis-nav').addClass('trans-nav')
