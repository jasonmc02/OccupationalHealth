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
      t.string :other
      t.boolean :municipal
      t.boolean :regiona
      t.boolean :national
      t.boolean :other
      t.boolean :none
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
      t.string :inlfuence_description
      t.boolean :develop_understanding
      t.boolean :including_actor
      t.boolean :enhancing_participation
      t.boolean :improving_communication
      t.boolean :other
      t.boolean :none
      t.boolean :local
      t.boolean :regional
      t.boolean :national
      t.boolean :international
      t.boolean :global

      t.timestamps
    end
  end
end
