class FormularyProfile < ActiveRecord::Base

=begin
  has_one :formulary_profile_area, :dependent => :destroy
  accepts_nested_attributes_for :formulary_profile_reach, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
=end
end
