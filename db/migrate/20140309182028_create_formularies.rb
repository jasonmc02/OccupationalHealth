class CreateFormularies < ActiveRecord::Migration
  def change
    create_table :formularies do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end