$(document).on 'turbolinks:load', ->
  $('.parallax').parallax()
  $(".button-collapse").sideNav()
  $(window).on 'scroll', (e) ->
    # when the top of the window is at the same place as the top of the second nav
    if $(window).scrollTop() >= $('#navsep').offset().top
      # add original background-color and box-shadow
      $('#navigation').css 'background-color', '#EF5350'
      $('#navigation').css 'box-shadow', '0 2px 5px 0 #00000029, 0 2px 10px 0 #0000001f'
    else
      # remove background-color and box-shadow
      $('#navigation').css 'background-color', 'rgba(0,0,0,0)'
      $('#navigation').css 'box-shadow', 'none'
