class AddFormWrapperIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :wrapper_id, :integer
  end
end
