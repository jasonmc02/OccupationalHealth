class Formulary < ActiveRecord::Base

	has_one :formulary_profile, :dependent => :destroy
	has_one :formulary_context, :dependent => :destroy
	has_one :formulary_research, :dependent => :destroy
	has_one :formulary_action, :dependent => :destroy
	has_one :formulary_policy, :dependent => :destroy
	
	accepts_nested_attributes_for :formulary_profile, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
	accepts_nested_attributes_for :formulary_context, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
	accepts_nested_attributes_for :formulary_research, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
	accepts_nested_attributes_for :formulary_action, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
	accepts_nested_attributes_for :formulary_policy, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
end
