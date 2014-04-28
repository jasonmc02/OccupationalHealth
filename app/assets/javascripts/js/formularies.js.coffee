Formulary =
  currentStep: 1
  filters: null
  firstStep: null
  secondStep: null
  previousSelectedId: null
  previousImpactLevelId: null

Formulary.initialize = ->
  Formulary.filters = $("#portfolio #filters")
  Formulary.firstStep = $("#step1")
  Formulary.secondStep = $("#step2")
  Formulary.thirdStep = $("#step3")
  Formulary.fourthStep = $("#step4")
  Formulary.fifthStep = $("#step5")

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
  Formulary.removeLinkProyectChecks()
  if Formulary.previousSelectedId == self.attr("id")
    self.prop("checked", false)
    Formulary.previousSelectedId = null
  else
    self.prop("checked", true)
    Formulary.previousSelectedId = self.attr("id")
  Formulary.firstStep.find("#formulary_formulary_profile_attributes_which_project").attr("disabled", "disabled")
  if self.attr("id") == "formulary_formulary_profile_attributes_other_project" && self.prop("checked")
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