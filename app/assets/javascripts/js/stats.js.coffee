Stats = {}

Stats.releaseMemory = ->
  $.ajax
    url: "/home/release_memory"
    type: "put"
    success: (data) ->
      $("#ram-used").text(Stats.convertQuantity(data.ram_used))
      $("#ram-total").text(Stats.convertQuantity(data.ram_total))
      $("#hdd-used").text(Stats.convertQuantity(data.hdd_used))
      $("#hdd-total").text(Stats.convertQuantity(data.hdd_total))

Stats.convertQuantity = (a) ->
  if a == 0
    return '0 Bytes'
  b = 1000
  c = ['Bytes', 'KB', 'MB', 'GB', 'TB']
  z = Math.log(a)
  y = Math.log(b)
  console.log y
  x = z / y
  w = Math.floor(x)
  v = Math.pow(b, w)
  quantity = (a / v).toPrecision(3) + ' ' + c[w]
  return quantity

$(document).ready ->
  $("#release-memory").on "click", (e) ->
    e.preventDefault()
    Stats.releaseMemory()