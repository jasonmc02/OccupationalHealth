Answer = 
  form: null

Answer.initialize = ->
  Answer.form = $("form")

$(document).ready ->
  Answer.initialize()
  Answer.form.validate(
    submitHandler: (self) ->
      self.submit()
  )
