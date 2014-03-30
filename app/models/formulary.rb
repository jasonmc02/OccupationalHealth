class Formulary < ActiveRecord::Base

	has_one :formulary_profile, :dependent => :destroy
	has_one :formulary_context, :dependent => :destroy
	has_one :formulary_research, :dependent => :destroy
	has_one :formulary_action, :dependent => :destroy
	has_one :formulary_policy, :dependent => :destroy
	
	accepts_nested_attributes_for :formulary_profile, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :formulary_context, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :formulary_research, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :formulary_action, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :formulary_policy, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
