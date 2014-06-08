class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.integer :user_id
      t.string :file
      t.string :name
      t.boolean :share
      t.string :note
      t.string :misc

      t.timestamps
    end
  end
end
