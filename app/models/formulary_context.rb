class FormularyContext < ActiveRecord::Base

  has_one :formulary_context_ecosystem_feature, :dependent => :destroy
  has_one :formulary_context_description, :dependent => :destroy

  accepts_nested_attributes_for :formulary_context_ecosystem_feature, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :formulary_context_description, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  def self.options
    [
      {:key => 'research', :val => I18n.t("selects.formulary_context.research")},
      {:key => 'action', :val => I18n.t("selects.formulary_context.action")},
      {:key => 'policy', :val => I18n.t("selects.formulary_context.policy")}
    ]
  end
end
