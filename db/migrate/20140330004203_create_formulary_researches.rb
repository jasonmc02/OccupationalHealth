class CreateFormularyResearches < ActiveRecord::Migration
  def change
    create_table :formulary_researches do |t|
      t.string :formulary_id
      t.boolean :interaction
      t.string :interaction_name
      t.boolean :integrate_investigation
      t.string :integtrate_investigation_yes
      t.string :integrate_investigation_no
      t.boolean :test_hypothesis
      t.boolean :generate_knowledge
      t.boolean :inlcude_actor
      t.boolean :translate_knowledge
      t.boolean :influencing_legislation
      t.boolean :no_impact
      t.string :other

      t.timestamps
    end
  end
end
