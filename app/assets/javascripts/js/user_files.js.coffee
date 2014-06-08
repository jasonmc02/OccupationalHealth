UserFile.initialize = ->
  UserFile.currentFile = 0
  UserFile.currentUserId = -1
  UserFile.currentUserRole = -1
  UserFile.newUserRole = -1
  UserFile.newUserRoleText = ""
  UserFile.body = null
  UserFile.body = $("#service_1")
  UserFile.modal = $("#modal-share-file")
  UserFile.filters = $("#portfolio #filters")

UserFile.fetchSharedUsers = (self) ->
  UserFile.currentFile = self.data("id")
  $.ajax
    url: "/user_file_shares/fetch_user_file_shares"
    dataType: "json"
    type: "get"
    data: 
      file_id: UserFile.currentFile
    success: (users) ->
      UserFile.renderModal(users)

UserFile.renderModal = (users) ->
  tr = ""
  ck = ""
  $.each users, (index, user) ->
    if user.is_shared then ck = "checked" else ck = ""
    tr += "<tr>" +
            "<td>" +
              "#{user.email}" +
            "</td>" +
            "<td>" +
              "<input type='checkbox' #{ck} value='#{user.id}'/>" +
            "</td>" +
          "</tr>"
  UserFile.modal.find("#users").html("")
  UserFile.modal.find("#users").append(tr)
  UserFile.modal.modal("show")

UserFile.shareFile = ->
  inputs = UserFile.modal.find("input")
  admins = []
  $.each inputs, (index, input) ->
    admins.push({user_id: $(input).val(), share: $(input).prop("checked")})
  UserFile.saveSharing(admins)

UserFile.saveSharing = (admins) ->
  $.ajax
    url: "/user_file_shares/upsert_user_file_shares"
    dataType: "json"
    type: "post"
    data: 
      users: admins,
      file_id: UserFile.currentFile

UserFile.hideSteps = ->
  $(".steps").hide()

UserFile.showCurrentStep = ->
  $("#step#{UserFile.currentStep}").show()

UserFile.clickFilterEvent = (self) ->
  UserFile.filters.find("a.active").removeClass("active")
  self.addClass("active")
  UserFile.currentStep = self.data("step")
  UserFile.hideSteps()
  UserFile.showCurrentStep()

$(document).ready ->
  UserFile.initialize()
  UserFile.showCurrentStep()
  UserFile.body.on "click", ".share", (w) ->
    w.preventDefault()
    UserFile.fetchSharedUsers($(@))
  UserFile.modal.on "click", ".share", (w) ->
    w.preventDefault()
    UserFile.shareFile()
  UserFile.filters.on "click", "a", (w) ->
    w.preventDefault()
    UserFile.clickFilterEvent($(@))