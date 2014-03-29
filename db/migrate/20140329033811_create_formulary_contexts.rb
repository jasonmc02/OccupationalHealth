class CreateFormularyContexts < ActiveRecord::Migration
  def change
    create_table :formulary_contexts do |t|
      t.text :scale_description
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

      t.timestamps
    end
  end
end
