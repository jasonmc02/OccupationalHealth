FormWrapper =
  currentStep: 1
  filters: null
  firstStep: null
  secondStep: null
  previousSelectedId: null
  previousImpactLevelId: null

FormWrapper.initialize = ->
  FormWrapper.form = $("form")
  FormWrapper.filters = $("#portfolio #filters")
  FormWrapper.firstStep = $("#step1")
  FormWrapper.secondStep = $("#step2")

FormWrapper.hideSteps = ->
  $(".steps").hide()

FormWrapper.showCurrentStep = ->
  $("#step#{FormWrapper.currentStep}").show()

FormWrapper.goToStep = (step) ->
  $("#step#{step}").show()

FormWrapper.clickFilterEvent = (self) ->
  FormWrapper.currentStep = self.data("step")
  FormWrapper.hideSteps()
  FormWrapper.showCurrentStep()

FormWrapper.unlockWhichAreas = (self) ->
  FormWrapper.firstStep.find(".which_areas input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.firstStep.find(".which_areas input").removeAttr("disabled")

FormWrapper.removeLinkProyectChecks = ->
  FormWrapper.firstStep.find(".linked_proyect input").prop("checked", false)

FormWrapper.addLinkProyectCheck = (self) ->
  unless self.attr("id") == "formulary_formulary_profile_attributes_which_project"
    FormWrapper.removeLinkProyectChecks()
  if FormWrapper.previousSelectedId == self.attr("id")
    self.prop("checked", false)
    FormWrapper.previousSelectedId = null
  else
    self.prop("checked", true)
    FormWrapper.previousSelectedId = self.attr("id")
  FormWrapper.firstStep.find("#formulary_formulary_profile_attributes_which_project").attr("disabled", "disabled")
  if (self.attr("id") == "formulary_formulary_profile_attributes_other_project" && self.prop("checked")) || (self.attr("id") == "formulary_formulary_profile_attributes_which_project" && FormWrapper.firstStep.find("#formulary_formulary_profile_attributes_other_project").prop("checked"))
    FormWrapper.firstStep.find("#formulary_formulary_profile_attributes_which_project").removeAttr("disabled")

FormWrapper.unlockDisruptTypes = (self) ->
  FormWrapper.secondStep.find(".disrupt_types input").attr("disabled", "disabled")
  FormWrapper.secondStep.find(".disrupt_types input").prop("checked", false)
  if self.prop("checked")
    FormWrapper.secondStep.find(".disrupt_types input").removeAttr("disabled")

FormWrapper.unlockForestTypes = (self) ->
  FormWrapper.secondStep.find(".forest_types input[type='checkbox']").attr("disabled", "disabled")
  FormWrapper.secondStep.find(".forest_types input[type='checkbox']").prop("checked", false)
  if self.prop("checked")
    FormWrapper.secondStep.find(".forest_types input[type='checkbox']").removeAttr("disabled")

FormWrapper.unlockWhichScales = (self) ->
  FormWrapper.secondStep.find(".which_scales input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.secondStep.find(".which_scales input").removeAttr("disabled")

FormWrapper.unlockWhichWaterSheeds = (self) ->
  FormWrapper.secondStep.find(".which_watersheeds input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.secondStep.find(".which_watersheeds input").removeAttr("disabled")

FormWrapper.unlockWhichIntersectoralAspects = (self) ->
  FormWrapper.secondStep.find(".which_intersectoral_aspect select").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_intersectoral_aspect select").removeAttr("disabled")

FormWrapper.unlockWhichPoliticalJuridisction = (self) ->
  FormWrapper.secondStep.find(".which_political_jurisdiction input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_political_jurisdiction input").removeAttr("disabled")

FormWrapper.unlockWhichLocalContext = (self) ->
  FormWrapper.secondStep.find(".which_local_context input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_local_context input").removeAttr("disabled")

FormWrapper.unlockWhichProjectAffect = (self) ->
  FormWrapper.secondStep.find(".which_project_affect input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_project_affect input").removeAttr("disabled")

FormWrapper.unlockWhichRoleConsideration = (self) ->
  FormWrapper.secondStep.find(".which_role_consideration input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_role_consideration input").removeAttr("disabled")

FormWrapper.unlockWhichSuccessConsideration = (self) ->
  FormWrapper.secondStep.find(".which_success_consideration input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_success_consideration input").removeAttr("disabled")

FormWrapper.unlockWhichRequireIntegration = (self) ->
  FormWrapper.secondStep.find(".which_require_integration input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.secondStep.find(".which_require_integration input").removeAttr("disabled")

FormWrapper.unlockWhichApproach = (self) ->
  FormWrapper.secondStep.find(".which_approach input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.secondStep.find(".which_approach input").removeAttr("disabled")

FormWrapper.unlockWhichInteraction = (self) ->
  FormWrapper.thirdStep.find(".which_interaction input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.thirdStep.find(".which_interaction input").removeAttr("disabled")

FormWrapper.unlockWhichIntegrateInvestigation = (self) ->
  if self.val() == "false"
    FormWrapper.thirdStep.find(".which_integrate_investigation_no").removeClass("hide")
    FormWrapper.thirdStep.find(".which_integrate_investigation_yes").addClass("hide")
  else
    FormWrapper.thirdStep.find(".which_integrate_investigation_no").addClass("hide")
    FormWrapper.thirdStep.find(".which_integrate_investigation_yes").removeClass("hide")

FormWrapper.unlockWhichIntegration = (self) ->
  FormWrapper.thirdStep.find(".which_integration input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.thirdStep.find(".which_integration input").removeAttr("disabled")

FormWrapper.unlockWhichFactorAffects = (self) ->
  FormWrapper.fourthStep.find(".which_factor_affects input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.fourthStep.find(".which_factor_affects input").removeAttr("disabled")

FormWrapper.removeImpactLevelChecks = ->
  FormWrapper.fourthStep.find(".impact_level input").prop("checked", false)

FormWrapper.addImpactLevelCheck = (self) ->
  FormWrapper.removeImpactLevelChecks()
  if FormWrapper.previousImpactLevelId == self.attr("id")
    self.prop("checked", false)
    FormWrapper.previousImpactLevelId = null
  else
    self.prop("checked", true)
    FormWrapper.previousImpactLevelId = self.attr("id")

FormWrapper.unlockWhichOtherDescription = (self) ->
  FormWrapper.fifthStep.find(".which_other_description input").attr("disabled", "disabled")
  if self.prop("checked")
    FormWrapper.fifthStep.find(".which_other_description input").removeAttr("disabled")

FormWrapper.unlockWhichMultipleKind = (self) ->
  FormWrapper.fifthStep.find(".which_multiple_kind input").attr("disabled", "disabled")
  if self.val() == "true"
    FormWrapper.fifthStep.find(".which_multiple_kind input").removeAttr("disabled")

FormWrapper.addContact = (self) ->
  time = new Date().getTime()
  regexp = new RegExp(self.data("id"), "g")
  FormWrapper.secondStep.find(".section-rows").append(self.data("fields").replace(regexp, time))

FormWrapper.removeContact = (self) ->
  self.closest("tr").find("input[type=hidden]").val(1)
  self.closest("tr").hide()

$(document).ready ->
  FormWrapper.initialize()
  FormWrapper.showCurrentStep()
  FormWrapper.form.on "click", "button.next-step", (w) ->
    w.preventDefault()
    FormWrapper.clickFilterEvent($(@))
  FormWrapper.firstStep.on "click", "#formulary_formulary_profile_attributes_other_areas", ->
    FormWrapper.unlockWhichAreas($(@))
  FormWrapper.firstStep.on "click", ".linked_proyect input", ->
    FormWrapper.addLinkProyectCheck($(@))
  FormWrapper.secondStep.on "click", "#formulary_formulary_context_attributes_disrupted", ->
    FormWrapper.unlockDisruptTypes($(@))
  FormWrapper.secondStep.on "click", "#formulary_formulary_context_attributes_forest", ->
    FormWrapper.unlockForestTypes($(@))
  FormWrapper.secondStep.on "click", "#formulary_formulary_context_attributes_other_scale", ->
    FormWrapper.unlockWhichScales($(@))
  FormWrapper.secondStep.on "click", "#formulary_formulary_context_attributes_watershed", ->
    FormWrapper.unlockWhichWaterSheeds($(@))
  FormWrapper.secondStep.on "change", ".intersectoral_aspect", ->
    FormWrapper.unlockWhichIntersectoralAspects($(@))
  FormWrapper.secondStep.on "change", ".political_jurisdiction", ->
    FormWrapper.unlockWhichPoliticalJuridisction($(@))
  FormWrapper.secondStep.on "change", ".local_context", ->
    FormWrapper.unlockWhichLocalContext($(@))
  FormWrapper.secondStep.on "change", ".project_affect", ->
    FormWrapper.unlockWhichProjectAffect($(@))
  FormWrapper.secondStep.on "change", ".role_consideration", ->
    FormWrapper.unlockWhichRoleConsideration($(@))
  FormWrapper.secondStep.on "change", ".success_consideration", ->
    FormWrapper.unlockWhichSuccessConsideration($(@))
  FormWrapper.secondStep.on "change", ".require_integration", ->
    FormWrapper.unlockWhichRequireIntegration($(@))
  FormWrapper.secondStep.on "click", "#formulary_formulary_context_attributes_other_approach", ->
    FormWrapper.unlockWhichApproach($(@))
  FormWrapper.secondStep.on "click", ".add-section", (w) ->
    w.preventDefault()
    FormWrapper.addContact($(@))
  FormWrapper.secondStep.on "click", ".remove-contact", (w) ->
    w.preventDefault()
    FormWrapper.removeContact($(@))