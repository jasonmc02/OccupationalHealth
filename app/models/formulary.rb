class Formulary < ActiveRecord::Base

  belongs_to :user

  has_one :formulary_profile, :dependent => :destroy
  has_one :formulary_context, :dependent => :destroy
  has_one :formulary_research, :dependent => :destroy
  has_one :formulary_action, :dependent => :destroy
  has_one :formulary_policy, :dependent => :destroy
  has_many :formulary_contacts, :dependent => :destroy

  accepts_nested_attributes_for :formulary_profile, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_context, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_research, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_action, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_policy, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_contacts, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }

end
