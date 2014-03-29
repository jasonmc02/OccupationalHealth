class FormularyContextDescription < ActiveRecord::Base
  
  def self.options
    [
      {:key => 'short', :val => I18n.t("selects.formulary_context_description.short")},
      {:key => 'medium', :val => I18n.t("selects.formulary_context_description.medium")},
      {:key => 'large', :val => I18n.t("selects.formulary_context_description.large")}
    ]
  end
end
