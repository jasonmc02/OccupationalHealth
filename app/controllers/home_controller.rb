class HomeController < ApplicationController
  def index
    @formulary_profile = FormularyProfile.new
    @formulary_profile.build_formulary_profile_area
    @formulary_profile.build_formulary_profile_classify
    @formulary_profile.build_formulary_profile_reach
  end
end
