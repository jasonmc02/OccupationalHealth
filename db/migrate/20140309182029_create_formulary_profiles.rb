class CreateFormularyProfiles < ActiveRecord::Migration
  def change
    create_table :formulary_profiles do |t|
      t.integer :formulary_id
      t.string :name
      t.string :period
      t.string :region
      t.string :institution
      t.boolean :mining
      t.boolean :pesticide
      t.boolean :occupational_health
      t.boolean :community_paticipation
      t.boolean :watershed_management
      t.boolean :solid_waste_management
      t.boolean :public_health
      t.boolean :animal_health
      t.boolean :determinant_of_health
      t.boolean :food_sovereignty
      t.boolean :indigenous_health
      t.boolean :climate_change
      t.boolean :forest_management
      t.boolean :training
      t.boolean :other_areas
      t.string :which_areas
      t.boolean :project
      t.boolean :part_program
      t.boolean :entire_program
      t.boolean :other_project
      t.string :which_project
      t.text :objective
      t.text :discipline
      t.boolean :research
      t.boolean :action
      t.boolean :policy
      t.text :success

      t.timestamps
    end
  end
end