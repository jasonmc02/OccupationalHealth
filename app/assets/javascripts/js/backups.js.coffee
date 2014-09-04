Backups =
  currentStep: 1

Backups.initialize = ->
  Backups.modal = $("#upload-file-modal")

Backups.openModal = ->
  Backups.modal.modal("show")

Backups.uploadFile = ->
  element = Backups.modal.find("#sql-file")
  file = element[0].files[0]
  element.val("")
  formData = new FormData()
  if file.type.match "text/x-sql"
    formData.append("file", file)
    $.ajax
      url: "/home/restore_backup"
      type: "post"
      processData: false
      cache: false
      contentType: false
      data: formData

$(document).ready ->
  Backups.initialize()
  $(".upload-file").on "click", (e) ->
    e.preventDefault()
    Backups.openModal()
  Backups.modal.on "click", ".upload", (e) ->
    e.preventDefault()
    Backups.uploadFile()