class CreateFormularyProfileClassifies < ActiveRecord::Migration
  def change
    create_table :formulary_profile_classifies do |t|
      t.integer :formulary_profile_id
      t.boolean :project
      t.boolean :part_program
      t.boolean :entire_program
      t.boolean :other
      t.string :which

      t.timestamps
    end
  end
end
