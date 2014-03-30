class CreateFormularyProfiles < ActiveRecord::Migration
  def change
    create_table :formulary_profiles do |t|
      t.integer :formulary_id
      t.string :name
      t.string :period
      t.string :region
      t.string :institution
      t.text :description
      t.text :objective
      t.text :discipline
      t.text :success

      t.timestamps
    end
  end
end