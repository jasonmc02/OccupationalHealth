class CreateFormularyContextDescriptions < ActiveRecord::Migration
  def change
    create_table :formulary_context_descriptions do |t|
      t.integer :formulary_context_id
      t.string :project_term
      t.boolean :require_integration
      t.string :require_integration_name
      t.boolean :gender
      t.boolean :equity
      t.boolean :community_participation
      t.boolean :policy
      t.boolean :complexity
      t.string :other

      t.timestamps
    end
  end
end
