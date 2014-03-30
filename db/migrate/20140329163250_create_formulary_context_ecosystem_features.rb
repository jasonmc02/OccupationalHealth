class CreateFormularyContextEcosystemFeatures < ActiveRecord::Migration
  def change
    create_table :formulary_context_ecosystem_features do |t|
      t.integer :formulary_context_id
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

      t.timestamps
    end
  end
end
