$(document).on 'turbolinks:load', ->
  $(window).on 'scroll', (e) ->
    # when the top of the window is at the same place as the top of the second nav
    if $(window).scrollTop() >= $('#navsep').offset().top
      # add original background-color and box-shadow
      $('#navigation').removeClass('trans-nav').addClass('vis-nav')
    else
      # remove background-color and box-shadow
      $('#navigation').removeClass('vis-nav').addClass('trans-nav')

  # enable the side navigation-menu on mobile
  $('.button-collapse').sideNav
    closeOnClick: true

  # smooth scrolling
  $('a[href^="#"]').on 'click', (e) ->
    e.preventDefault()

    # get href from the link clicked
    $target = $($(this).attr('href'))

    $('body,html').stop().animate {
      'scrollTop': Math.abs($('#index-banner').offset().top) +
        $target.position().top -
        $('#navigation').height() + 1
    }, 500, 'swing'

  # form validation
  # first we want to make the form invalid, this makes it possible for people
  # who don't have js enabled to use the form
  $('#submit').attr('disabled', 'true')

  $('input,textarea').on 'input', (e) ->
    # get value of email and message inputs
    email = $('#email').val()
    message = $('#message').val()
    email_re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/

    if (!email_re.test(email) || message == '')
      $('#submit').attr('disabled', 'true')
    else
      $('#submit').removeAttr 'disabled'
