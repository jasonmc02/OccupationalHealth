class AddFieldFormularyActions < ActiveRecord::Migration
  def change
    add_column :formulary_actions, :none_impact, :boolean
  end
end
