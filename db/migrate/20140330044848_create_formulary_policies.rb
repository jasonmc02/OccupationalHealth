class CreateFormularyPolicies < ActiveRecord::Migration
  def change
    create_table :formulary_policies do |t|
      t.integer :formulary_id
      t.string :intersectoral_design
      t.boolean :improve_strategies
      t.boolean :prevent_strategies
      t.boolean :actor_strategies
      t.boolean :other
      t.string :other_description
      t.boolean :multiple_kind
      t.string :multiple_kind_name
      t.text :improve_policies
      t.string :project_result

      t.timestamps
    end
  end
end
