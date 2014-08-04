Report = 
  form: null

Report.initialize = ->
  Report.form = $("form#search-formularies")
  Report.form.find(".datepicker").datepicker({format: "yyyy-mm-dd"})
  Report.modal = $("#modal-select-column")

Report.field_string = (st, sc, sk, text, selected) ->
  el = "<div class='row margin-override rp'>"
  el += "<div class='form-group col-md-8'>"
  el += "<button class='form-control remove_param' id='#{selected}' data-sk='#{sk}'>#{text}</button>"
  el += "</div>"
  el += "<div class='form-group col-md-4'>"
  el += "<input type='hidden' value='#{st}' class='st'>"
  el += "<input type='hidden' value='#{sc}' class='sc'>"
  el += "<input type='hidden' value='#{sk}' class='sk'>"
  el += "<input type='text' class='form-control sp'>"
  el += "</div>"
  el += "</div>"
  return el

Report.field_boolean_simple = (st, sc, sk, text, selected) ->
  el = "<div class='row margin-override rp'>"
  el += "<div class='form-group col-md-8'>"
  el += "<button class='form-control remove_param' id='#{selected}' data-sk='#{sk}'>#{text}</button>"
  el += "</div>"
  el += "<div class='form-group col-md-4'>"
  el += "<input type='hidden' value='#{st}' class='st'>"
  el += "<input type='hidden' value='#{sc}' class='sc'>"
  el += "<input type='hidden' value='#{sk}' class='sk'>"
  el += "<input type='hidden' class='form-control sp' value='true'>"
  el += "</div>"
  el += "</div>"
  return el

Report.field_date = (st, sc, sk, text, selected) ->
  el = "<div class='row margin-override rp'>"
  el += "<div class='form-group col-md-8'>"
  el += "<button class='form-control remove_param' id='#{selected}' data-sk='#{sk}'>#{text}</button>"
  el += "</div>"
  el += "<div class='form-group col-md-4'>"
  el += "<input type='hidden' value='#{st}' class='st'>"
  el += "<input type='hidden' value='#{sc}' class='sc'>"
  el += "<input type='hidden' value='#{sk}' class='sk'>"
  el += "<input type='text' class='form-control sp datepicker'>"
  el += "</div>"
  el += "</div>"
  return el

Report.add_field = (st, sc, sk, text, selected, target) ->
  el = ""
  switch sk
    when "string"
      el = Report.field_string(st, sc, sk, text, selected)
      Report.form.find(".last-row").before(el)
      Report.modal.modal("hide")
      break
    when "boolean"
      target.next("div").removeClass("hide")
      break
    when "boolean_simple"
      el = Report.field_boolean_simple(st, sc, sk, text, selected)
      Report.form.find(".last-row").before(el)
      Report.modal.modal("hide")
      break
    when "date_beging"
      el = Report.field_date(st, sc, sk, text, selected)
      Report.form.find(".last-row").before(el)
      Report.form.find(".datepicker").datepicker({format: "yyyy-mm-dd"})
      Report.modal.modal("hide")
      break
    when "date_end"
      el = Report.field_date(st, sc, sk, text, selected)
      Report.form.find(".last-row").before(el)
      Report.form.find(".datepicker").datepicker({format: "yyyy-mm-dd"})
      Report.modal.modal("hide")
      break
    when "select"
      target.next("div").removeClass("hide")
      break

Report.remove_param_rowa = (sk, selected) ->
  switch sk
    when "string"
      Report.modal.find('#' + selected).removeClass("active")
      Report.form.find("#" + selected).closest(".margin-override").remove()
      break
    when "boolean"
      while Report.form.find("#" + selected).length > 0
        Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.find('#' + selected).removeClass("added")
      Report.modal.find('#' + selected).removeClass("active")
      break
    when "boolean_simple"
      Report.modal.find('#' + selected).removeClass("active")
      Report.form.find("#" + selected).closest(".margin-override").remove()
      break
    when "date_beging"
      Report.modal.find('#' + selected).removeClass("active")
      Report.form.find("#" + selected).closest(".margin-override").remove()
      break
    when "date_end"
      Report.modal.find('#' + selected).removeClass("active")
      Report.form.find("#" + selected).closest(".margin-override").remove()
      break
    when "select"
      Report.modal.find('#' + selected).removeClass("active")
      Report.modal.find('#' + selected).removeClass("added")
      Report.form.find("#" + selected).closest(".margin-override").remove()
      break

Report.remove_param_rowb = (selected, sk) ->
  switch sk
    when "string"
      Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.modal("hide")
      break
    when "boolean"
      while Report.form.find("#" + selected).length > 0
        Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.find("#" + selected).next("div").addClass("hide")
      Report.modal.find("#" + selected).removeClass("added")
      Report.modal.modal("hide")
      break
    when "boolean_simple"
      Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.modal("hide")
      break
    when "date_beging"
      Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.modal("hide")
      break
    when "date_end"
      Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.modal("hide")
      break
    when "select"
      Report.form.find("#" + selected).closest(".margin-override").remove()
      Report.modal.find("#" + selected).removeClass("added")
      Report.modal.modal("hide")
      break

Report.build_object = ->
  rows = Report.form.find(".rp")
  obj = 
    formulary_profiles: []
    formulary_contexts: []
    formulary_researches: []
    formulary_actions: []
    formulary_policies: []
  flag = false
  $.each rows, (key, val) ->
    st = $(val).find(".st").val()
    sc = $(val).find(".sc").val()
    sp = $(val).find(".sp").val()
    sk = $(val).find(".sk").val()
    unless sp == ""
      switch st
        when "formulary_profiles"
          obj.formulary_profiles.push({"sc": sc, "sp": sp, "sk": sk})
          break
        when "formulary_contexts"
          obj.formulary_contexts.push({"sc": sc, "sp": sp, "sk": sk})
          break
        when "formulary_researches"
          obj.formulary_researches.push({"sc": sc, "sp": sp, "sk": sk})
          break
        when "formulary_actions"
          obj.formulary_actions.push({"sc": sc, "sp": sp, "sk": sk})
          break
        when "formulary_policies"
          obj.formulary_policies.push({"sc": sc, "sp": sp, "sk": sk})
          break
      flag = true
  return {"obj": obj, "flag": flag}

Report.fetch_formularies = ->
  object = Report.build_object()
  if object.flag
    $.ajax
      url: "/home/fetch_formularies"
      type: "post"
      data: object.obj
      dataType: "script"

Report.add_field_custom = ->
  rows = Report.modal.find(".attributes a.active")
  names = []
  $.each rows, (key, val) ->
    sk = $(val).data("sk")
    text_main = $(val).text()
    selected = $(val).attr("id")
    added = $(val).hasClass("added")
    if sk == "boolean" && !added
      options = $(val).next("div.options").find("input")
      $.each options, (key, val) ->
        if $(val).prop("checked")
          st = $(val).data("st")
          sc = $(val).data("sc")
          text = $(val).closest("label").text()
          el = "<div class='row margin-override rp hide'>"
          el += "<div class='form-group col-md-8'>"
          el += "<button class='form-control remove_param' id='#{selected}'>#{text}</button>"
          el += "</div>"
          el += "<div class='form-group col-md-4'>"
          el += "<input type='hidden' value='#{st}' class='st'>"
          el += "<input type='hidden' value='#{sc}' class='sc'>"
          el += "<input type='hidden' value='#{sk}' class='sk'>"
          el += "<input type='checkbox' class='form-control sp' value='true'>"
          el += "</div>"
          el += "</div>"
          names.push(text.trim())
          Report.form.find(".last-row").before(el)
          $(val).prop("checked", false)
      el = "<div class='row margin-override rp'>"
      el += "<div class='form-group col-md-8'>"
      el += "<button class='form-control remove_param' id='#{selected}' data-sk='#{sk}'>#{text_main}</button>"
      el += "</div>"
      el += "<div class='form-group col-md-4'>"
      el += "<input class='form-control sp' value='#{names.join(', ')}' readonly='true'>"
      el += "</div>"
      el += "</div>"
      Report.form.find(".last-row").before(el)
      $(val).next("div").addClass("hide")
      $(val).addClass("added")
    if sk == "select" && !added
      element = $(val).next("div.options").find("select")
      text = element.find("option:selected").text()
      st = $(element).data("st")
      sc = $(element).data("sc")
      value = $(element).val()
      el = "<div class='row margin-override rp'>"
      el += "<div class='form-group col-md-8'>"
      el += "<button class='form-control remove_param' id='#{selected}' data-sk='#{sk}'>#{text_main}</button>"
      el += "</div>"
      el += "<div class='form-group col-md-4'>"
      el += "<input type='hidden' value='#{st}' class='st'>"
      el += "<input type='hidden' value='#{sc}' class='sc'>"
      el += "<input type='hidden' value='#{sk}' class='sk'>"
      el += "<input type='hidden' value='#{value}' class='sp'>"
      el += "<input type='text' class='form-control' readonly='true' value='#{text}'>"
      el += "</div>"
      el += "</div>"
      Report.form.find(".last-row").before(el)
      $(val).next("div").addClass("hide")
      $(val).addClass("added")
  Report.modal.modal("hide")

$(document).ready ->
  Report.initialize()
  Report.form.on "click", "#add_param", (e) ->
    e.preventDefault()
    Report.modal.modal("show")
  Report.form.on "click", ".remove_param", (e) ->
    e.preventDefault()
    Report.remove_param_rowa($(e.currentTarget).data('sk'), $(e.currentTarget).attr('id'))
  Report.modal.on "click", ".attributes a", (e) ->
    e.preventDefault()
    currentTarget = $(e.currentTarget)
    if currentTarget.hasClass("active")
      currentTarget.removeClass("active")
      Report.remove_param_rowb(currentTarget.attr("id"), currentTarget.data("sk"))
    else
      currentTarget.addClass("active")
      Report.add_field(currentTarget.data("st"), currentTarget.data("sc"), currentTarget.data("sk"), currentTarget.text(), currentTarget.attr("id"), currentTarget)
  Report.modal.on "click", ".add-params", (e) ->
    e.preventDefault()
    Report.add_field_custom()
  Report.form.on "submit", (e) -> 
    e.preventDefault()
    Report.fetch_formularies()