Home = 
  screenWidth: window.innerWidth

Home.initialize = ->
  if Home.screenWidth > 1200
    $("#ideas img").css("right", (Home.screenWidth / 2 - 425))
  else
    $("#ideas img").css("right", (Home.screenWidth / 2 - 300))

$(document).ready ->
  Home.initialize()
  $(window).resize ->
    Home.screenWidth = window.innerWidth
    Home.initialize()