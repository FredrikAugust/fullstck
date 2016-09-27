$(document).ready ->
  $('.parallax').parallax()
  $(".button-collapse").sideNav()
  $(window).on 'scroll', (e) ->
    if $(window).scrollTop() >= $('#navsep').offset().top
      $('#navigation').css 'background-color', '#EF5350'
      $('#navigation').css 'box-shadow', '0 2px 5px 0 #00000029, 0 2px 10px 0 #0000001f'
    else
      $('#navigation').css 'background-color', 'rgba(0,0,0,0)'
      $('#navigation').css 'box-shadow', 'none'
