Answer = 
  form: null

Answer.initialize = ->
  Answer.form = $("form")
  Answer.form.find(".datepicker").datepicker({format: "yyyy-mm-dd"})

$(document).ready ->
  Answer.initialize()
  Answer.form.validate(
    submitHandler: (self) ->
      self.submit()
  )
