Home = 
  screenWidth: (screen.width / 2) - 425

Home.initialize = ->
  $("#ideas img").css("right", Home.screenWidth)

$(document).ready ->
  Home.initialize()