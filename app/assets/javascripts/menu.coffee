$(document).ready ->
  $('.menu-icon').click ->
    $('#navbar li:nth-child(n+2)').toggle('.dropdown')
    $(this).toggleClass('open')
    return


