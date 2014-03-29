class HomeController < ApplicationController
  def index
    @formulary_profile = FormularyProfile.new
    @formulary_profile.build_formulary_profile_area
    @formulary_profile.build_formulary_profile_classify
    @formulary_profile.build_formulary_profile_reach
    @formulary_context = FormularyContext.new
    @formulary_context.build_formulary_context_ecosystem_feature
    @formulary_context.build_formulary_context_description
    @context_options = FormularyContext.options
    @description_options = FormularyContextDescription.options
  end
end
