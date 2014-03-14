class CreateFormularyProfileAreas < ActiveRecord::Migration
  def change
    create_table :formulary_profile_areas do |t|
      t.integer :formulary_profile_id
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
      t.boolean :other
      t.string :which

      t.timestamps
    end
  end
end
