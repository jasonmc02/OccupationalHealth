class FormularyProfile < ActiveRecord::Base

  has_one :formulary_profile_area, :dependent => :destroy
  has_one :formulary_profile_classify, :dependent => :destroy
  has_one :formulary_profile_reach, :dependent => :destroy

  accepts_nested_attributes_for :formulary_profile_area, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :formulary_profile_classify, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :formulary_profile_reach, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
