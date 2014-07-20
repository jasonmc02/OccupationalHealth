class CreateFormularyActions < ActiveRecord::Migration
  def change
    create_table :formulary_actions do |t|
      t.integer :formulary_id
      t.boolean :community_leader
      t.boolean :decision_maker
      t.boolean :other_research_group
      t.boolean :community_group
      t.boolean :ngos
      t.boolean :business
      t.boolean :church
      t.boolean :other_participation
      t.boolean :municipal_actors
      t.boolean :regional_actors
      t.boolean :national_actors
      t.boolean :other_actors
      t.boolean :none_actors
      t.boolean :entire_process
      t.boolean :research_part
      t.boolean :not_participatory_process
      t.boolean :factor_affects
      t.string :factor_affects_name
      t.boolean :implement
      t.string :implement_description
      t.boolean :new_methodologies
      t.string :new_methodologies_description
      t.boolean :other_incorporation
      t.string :other_incorporation_description
      t.boolean :influence
      t.string :influence_description
      t.boolean :develop_understanding
      t.boolean :including_actor
      t.boolean :enhancing_participation
      t.boolean :improving_communication
      t.boolean :other_changes
      t.boolean :none_changes
      t.boolean :local_impacts
      t.boolean :regional_impacts
      t.boolean :national_impacts
      t.boolean :international_impacts
      t.boolean :global_impacts

      t.timestamps
    end
  end
end
