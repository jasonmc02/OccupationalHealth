class FormularyPolicy < ActiveRecord::Base

  def self.intersectoral_design
    [
      {:key => 'design', :val => I18n.t("selects.formulary_policy_intersectoral_design.design")},
      {:key => 'execution', :val => I18n.t("selects.formulary_policy_intersectoral_design.execution")},
      {:key => 'design_execution', :val => I18n.t("selects.formulary_policy_intersectoral_design.design_execution")},
      {:key => 'none', :val => I18n.t("selects.formulary_policy_intersectoral_design.none")},
    ]
  end

  def self.project_result
    [
      {:key => 'short', :val => I18n.t("selects.formulary_policy_project_result.short")},
      {:key => 'medium', :val => I18n.t("selects.formulary_policy_project_result.medium")},
      {:key => 'large', :val => I18n.t("selects.formulary_policy_project_result.large")},
      {:key => 'project_end', :val => I18n.t("selects.formulary_policy_project_result.project_end")},
    ]
  end
end
