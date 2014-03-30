class CreateFormularyContexts < ActiveRecord::Migration
  def change
    create_table :formulary_contexts do |t|
      t.integer :formulary_id
      t.text :scale_description
      t.boolean :urban
      t.boolean :semiurban
      t.boolean :rural
      t.boolean :wilderness
      t.boolean :disrupted
      t.boolean :resource_extraction
      t.boolean :environmental_degradation
      t.boolean :climate_effect
      t.boolean :natural_force
      t.boolean :coastal
      t.boolean :agricultural
      t.boolean :forest
      t.boolean :rainfores
      t.boolean :cloud_forest
      t.boolean :dry_forest
      t.boolean :old_growth_forest
      t.boolean :mixed_forest
      t.string :other
      t.boolean :watershed
      t.string :watersheed_name
      t.boolean :wetland
      t.boolean :desert
      t.boolean :intersectoral_aspect
      t.string :intersectoral_aspect_name
      t.boolean :political_jurisdiction
      t.string :political_jurisdictions_name
      t.text :sociopolitical_context
      t.boolean :local_context
      t.string :local_context_name
      t.boolean :project_affect
      t.string :project_affect_name
      t.boolean :role_consideration
      t.string :role_consideration_name
      t.text :key_actors
      t.boolean :success_consideration
      t.string :success_considerantion_name
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