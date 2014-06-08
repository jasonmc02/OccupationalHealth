class CreateUserFileShares < ActiveRecord::Migration
  def change
    create_table :user_file_shares do |t|
      t.integer :user_id
      t.integer :user_file_id

      t.timestamps
    end
  end
end
