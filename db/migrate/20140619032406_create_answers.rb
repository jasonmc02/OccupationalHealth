class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :custom_form_id
      t.integer :user_id
      t.string :answer_text
      t.string :question_type
      t.string :question_text
      t.string :language, :default => "en"
      t.string :user_counter, :default => 0

      t.timestamps
    end
  end
end
