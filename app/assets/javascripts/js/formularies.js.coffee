Formulary =
  currentStep: 1
  filters: null
  firstStep: null
  secondStep: null
  previousSelectedId: null
  previousImpactLevelId: null

Formulary.initialize = ->
  $(".datepicker").datepicker({format: "yyyy-mm-dd"})
  Formulary.form = $("form")
  Formulary.filters = $("#portfolio #filters")
  Formulary.firstStep = $("#step1")
  Formulary.secondStep = $("#step2")
  Formulary.thirdStep = $("#step3")
  Formulary.fourthStep = $("#step4")
  Formulary.fifthStep = $("#step5")
  unless Formulary.form.attr("id") == "new_formulary"
    if Formulary.firstStep.find("#formulary_formulary_profile_attributes_other_areas").prop("checked")
      Formulary.firstStep.find("#formulary_formulary_profile_attributes_which_areas").removeAttr("disabled")
    if Formulary.firstStep.find("#formulary_formulary_profile_attributes_other_project").prop("checked")
      Formulary.firstStep.find("#formulary_formulary_profile_attributes_which_project").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_disrupted").prop("checked")
      Formulary.secondStep.find(".disrupt_types input").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_forest").prop("checked")
      Formulary.secondStep.find(".forest_types input[type='checkbox']").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_other_scale").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_which_scale").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_watershed").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_watersheed_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_intersectoral_aspect_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_intersectoral_aspect_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_political_jurisdiction_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_political_jurisdictions_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_local_context_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_local_context_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_project_affect_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_project_affect_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_role_consideration_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_role_consideration_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_success_consideration_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_success_considerantion_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_require_integration_true").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_require_integration_name").removeAttr("disabled")
    if Formulary.secondStep.find("#formulary_formulary_context_attributes_other_approach").prop("checked")
      Formulary.secondStep.find("#formulary_formulary_context_attributes_which_approach").removeAttr("disabled")
    if Formulary.thirdStep.find("#formulary_formulary_research_attributes_interaction_true").prop("checked")
      Formulary.thirdStep.find("#formulary_formulary_research_attributes_interaction_name").removeAttr("disabled")
    if Formulary.thirdStep.find("#formulary_formulary_research_attributes_other_integration").prop("checked")
      Formulary.thirdStep.find("#formulary_formulary_research_attributes_which_integration").removeAttr("disabled")
    if Formulary.fourthStep.find("#formulary_formulary_action_attributes_factor_affects_true").prop("checked")
      Formulary.fourthStep.find("#formulary_formulary_action_attributes_factor_affects_name").removeAttr("disabled")
    if Formulary.fifthStep.find("#formulary_formulary_policy_attributes_other").prop("checked")
      Formulary.fifthStep.find("#formulary_formulary_policy_attributes_other_description").removeAttr("disabled")
    if Formulary.fifthStep.find("#formulary_formulary_policy_attributes_multiple_kind_true").prop("checked")
      Formulary.fifthStep.find("#formulary_formulary_policy_attributes_multiple_kind_name").removeAttr("disabled")
  else
    Formulary.firstStep.find(".remove-contact").remove()

Formulary.hideSteps = ->
  $(".steps").hide()

Formulary.showCurrentStep = ->
  $("#step#{Formulary.currentStep}").show()

Formulary.goToStep = (step) ->
  $("#step#{step}").show()

Formulary.clickFilterEvent = (self) ->
  Formulary.filters.find("a.active").removeClass("active")
  self.addClass("active")
  Formulary.currentStep = self.data("step")
  Formulary.hideSteps()
  Formulary.showCurrentStep()

Formulary.unlockWhichAreas = (self) ->
  Formulary.firstStep.find(".which_areas input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.firstStep.find(".which_areas input").removeAttr("disabled")

Formulary.removeLinkProyectChecks = ->
  Formulary.firstStep.find(".linked_proyect input").prop("checked", false)

Formulary.addLinkProyectCheck = (self) ->
  unless self.attr("id") == "formulary_formulary_profile_attributes_which_project"
    Formulary.removeLinkProyectChecks()
  if Formulary.previousSelectedId == self.attr("id")
    self.prop("checked", false)
    Formulary.previousSelectedId = null
  else
    self.prop("checked", true)
    Formulary.previousSelectedId = self.attr("id")
  Formulary.firstStep.find("#formulary_formulary_profile_attributes_which_project").attr("disabled", "disabled")
  if (self.attr("id") == "formulary_formulary_profile_attributes_other_project" && self.prop("checked")) || (self.attr("id") == "formulary_formulary_profile_attributes_which_project" && Formulary.firstStep.find("#formulary_formulary_profile_attributes_other_project").prop("checked"))
    Formulary.firstStep.find("#formulary_formulary_profile_attributes_which_project").removeAttr("disabled")

Formulary.unlockDisruptTypes = (self) ->
  Formulary.secondStep.find(".disrupt_types input").attr("disabled", "disabled")
  Formulary.secondStep.find(".disrupt_types input").prop("checked", false)
  if self.prop("checked")
    Formulary.secondStep.find(".disrupt_types input").removeAttr("disabled")

Formulary.unlockForestTypes = (self) ->
  Formulary.secondStep.find(".forest_types input[type='checkbox']").attr("disabled", "disabled")
  Formulary.secondStep.find(".forest_types input[type='checkbox']").prop("checked", false)
  if self.prop("checked")
    Formulary.secondStep.find(".forest_types input[type='checkbox']").removeAttr("disabled")

Formulary.unlockWhichScales = (self) ->
  Formulary.secondStep.find(".which_scales input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.secondStep.find(".which_scales input").removeAttr("disabled")

Formulary.unlockWhichWaterSheeds = (self) ->
  Formulary.secondStep.find(".which_watersheeds input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.secondStep.find(".which_watersheeds input").removeAttr("disabled")

Formulary.unlockWhichIntersectoralAspects = (self) ->
  Formulary.secondStep.find(".which_intersectoral_aspect select").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_intersectoral_aspect select").removeAttr("disabled")

Formulary.unlockWhichPoliticalJuridisction = (self) ->
  Formulary.secondStep.find(".which_political_jurisdiction input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_political_jurisdiction input").removeAttr("disabled")

Formulary.unlockWhichLocalContext = (self) ->
  Formulary.secondStep.find(".which_local_context input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_local_context input").removeAttr("disabled")

Formulary.unlockWhichProjectAffect = (self) ->
  Formulary.secondStep.find(".which_project_affect input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_project_affect input").removeAttr("disabled")

Formulary.unlockWhichRoleConsideration = (self) ->
  Formulary.secondStep.find(".which_role_consideration input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_role_consideration input").removeAttr("disabled")

Formulary.unlockWhichSuccessConsideration = (self) ->
  Formulary.secondStep.find(".which_success_consideration input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_success_consideration input").removeAttr("disabled")

Formulary.unlockWhichRequireIntegration = (self) ->
  Formulary.secondStep.find(".which_require_integration input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.secondStep.find(".which_require_integration input").removeAttr("disabled")

Formulary.unlockWhichApproach = (self) ->
  Formulary.secondStep.find(".which_approach input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.secondStep.find(".which_approach input").removeAttr("disabled")

Formulary.unlockWhichInteraction = (self) ->
  Formulary.thirdStep.find(".which_interaction input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.thirdStep.find(".which_interaction input").removeAttr("disabled")

Formulary.unlockWhichIntegrateInvestigation = (self) ->
  if self.val() == "false"
    Formulary.thirdStep.find(".which_integrate_investigation_no").removeClass("hide")
    Formulary.thirdStep.find(".which_integrate_investigation_yes").addClass("hide")
  else
    Formulary.thirdStep.find(".which_integrate_investigation_no").addClass("hide")
    Formulary.thirdStep.find(".which_integrate_investigation_yes").removeClass("hide")

Formulary.unlockWhichIntegration = (self) ->
  Formulary.thirdStep.find(".which_integration input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.thirdStep.find(".which_integration input").removeAttr("disabled")

Formulary.unlockWhichFactorAffects = (self) ->
  Formulary.fourthStep.find(".which_factor_affects input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.fourthStep.find(".which_factor_affects input").removeAttr("disabled")

Formulary.removeImpactLevelChecks = ->
  Formulary.fourthStep.find(".impact_level input").prop("checked", false)

Formulary.addImpactLevelCheck = (self) ->
  Formulary.removeImpactLevelChecks()
  if Formulary.previousImpactLevelId == self.attr("id")
    self.prop("checked", false)
    Formulary.previousImpactLevelId = null
  else
    self.prop("checked", true)
    Formulary.previousImpactLevelId = self.attr("id")

Formulary.unlockWhichOtherDescription = (self) ->
  Formulary.fifthStep.find(".which_other_description input").attr("disabled", "disabled")
  if self.prop("checked")
    Formulary.fifthStep.find(".which_other_description input").removeAttr("disabled")

Formulary.unlockWhichMultipleKind = (self) ->
  Formulary.fifthStep.find(".which_multiple_kind input").attr("disabled", "disabled")
  if self.val() == "true"
    Formulary.fifthStep.find(".which_multiple_kind input").removeAttr("disabled")

Formulary.addContact = (self) ->
  time = new Date().getTime()
  regexp = new RegExp(self.data("id"), "g")
  Formulary.firstStep.find(".contact-rows").append(self.data("fields").replace(regexp, time))

Formulary.removeContact = (self) ->
  self.closest("tr").find("input[type=hidden]").val(1)
  self.closest("tr").hide()

$(document).ready ->
  Formulary.initialize()
  Formulary.showCurrentStep()
  Formulary.filters.on "click", "a", (w) ->
    w.preventDefault()
    Formulary.clickFilterEvent($(@))
  Formulary.firstStep.on "click", "#formulary_formulary_profile_attributes_other_areas", ->
    Formulary.unlockWhichAreas($(@))
  Formulary.firstStep.on "click", ".linked_proyect input", ->
    Formulary.addLinkProyectCheck($(@))
  Formulary.secondStep.on "click", "#formulary_formulary_context_attributes_disrupted", ->
    Formulary.unlockDisruptTypes($(@))
  Formulary.secondStep.on "click", "#formulary_formulary_context_attributes_forest", ->
    Formulary.unlockForestTypes($(@))
  Formulary.secondStep.on "click", "#formulary_formulary_context_attributes_other_scale", ->
    Formulary.unlockWhichScales($(@))
  Formulary.secondStep.on "click", "#formulary_formulary_context_attributes_watershed", ->
    Formulary.unlockWhichWaterSheeds($(@))
  Formulary.secondStep.on "change", ".intersectoral_aspect", ->
    Formulary.unlockWhichIntersectoralAspects($(@))
  Formulary.secondStep.on "change", ".political_jurisdiction", ->
    Formulary.unlockWhichPoliticalJuridisction($(@))
  Formulary.secondStep.on "change", ".local_context", ->
    Formulary.unlockWhichLocalContext($(@))
  Formulary.secondStep.on "change", ".project_affect", ->
    Formulary.unlockWhichProjectAffect($(@))
  Formulary.secondStep.on "change", ".role_consideration", ->
    Formulary.unlockWhichRoleConsideration($(@))
  Formulary.secondStep.on "change", ".success_consideration", ->
    Formulary.unlockWhichSuccessConsideration($(@))
  Formulary.secondStep.on "change", ".require_integration", ->
    Formulary.unlockWhichRequireIntegration($(@))
  Formulary.secondStep.on "click", "#formulary_formulary_context_attributes_other_approach", ->
    Formulary.unlockWhichApproach($(@))
  Formulary.thirdStep.on "change", ".interaction", ->
    Formulary.unlockWhichInteraction($(@))
  Formulary.thirdStep.on "change", ".integrate_investigation", ->
    Formulary.unlockWhichIntegrateInvestigation($(@))
  Formulary.thirdStep.on "click", "#formulary_formulary_research_attributes_other_integration", ->
    Formulary.unlockWhichIntegration($(@))
  Formulary.fourthStep.on "change", ".factor_affects", ->
    Formulary.unlockWhichFactorAffects($(@))
  Formulary.fourthStep.on "click", ".impact_level input", ->
    Formulary.addImpactLevelCheck($(@))
  Formulary.fifthStep.on "click", "#formulary_formulary_policy_attributes_other", ->
    Formulary.unlockWhichOtherDescription($(@))
  Formulary.fifthStep.on "change", ".multiple_kind", ->
    Formulary.unlockWhichMultipleKind($(@))
  Formulary.firstStep.on "click", ".add-contact", (w) ->
    w.preventDefault()
    Formulary.addContact($(@))
  Formulary.firstStep.on "click", ".remove-contact", (w) ->
    w.preventDefault()
    Formulary.removeContact($(@))