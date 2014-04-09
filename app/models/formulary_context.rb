class FormularyContext < ActiveRecord::Base

  def self.intersectoral_aspect
    [
      {:key => 'research', :val => I18n.t("selects.formulary_context.research")},
      {:key => 'action', :val => I18n.t("selects.formulary_context.action")},
      {:key => 'policy', :val => I18n.t("selects.formulary_context.policy")}
    ]
  end
  
  def self.project_term
    [
      {:key => 'short', :val => I18n.t("selects.formulary_context_description.short")},
      {:key => 'medium', :val => I18n.t("selects.formulary_context_description.medium")},
      {:key => 'large', :val => I18n.t("selects.formulary_context_description.large")}
    ]
  end
end
