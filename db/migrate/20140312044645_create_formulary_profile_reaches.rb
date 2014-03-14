class CreateFormularyProfileReaches < ActiveRecord::Migration
  def change
    create_table :formulary_profile_reaches do |t|
      t.integer :formulary_profile_id
      t.boolean :research
      t.boolean :action
      t.boolean :policy

      t.timestamps
    end
  end
end
