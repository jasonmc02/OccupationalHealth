User = 
  currentUserContext: null
  currentUserId: -1
  currentUserRole: -1
  newUserRole: -1
  newUserRoleText: ""

User.initialize = ->
  User.content = $("#users")
  User.modalUpdateUser = $("#modal-update-user")

User.renderModal = (self) ->
  User.currentUserContext = self
  User.currentUserId = self.data("userId")
  User.currentUserRole = self.data("userRole")
  User.modalUpdateUser.find("#user-role").val(User.currentUserRole)
  User.modalUpdateUser.modal("show")

User.updateUserRole = (self) ->
  User.newUserRole = self.find("#user-role").val()
  User.newUserRoleText = self.find("#user-role option:selected").text()
  data =
    id: User.currentUserId
    role_id: User.newUserRole
  User.currentUserContext.closest(".user-row").find(".user-role-text").text(User.newUserRoleText)
  User.modalUpdateUser.modal("hide")
  User.saveChanges(data)

User.saveChanges = (data) ->
  $.ajax
    url: "/users/#{data.id}"
    dataType: "json"
    type: "put"
    data: 
      user: data

$(document).ready ->
  User.initialize()
  User.content.on "click", ".role-assign", (w) ->
    w.preventDefault()
    User.renderModal($(@))
  User.modalUpdateUser.on "submit", "#update-user-role", (w) ->
    w.preventDefault()
    User.updateUserRole($(@))
