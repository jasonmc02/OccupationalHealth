class CreateCustomForms < ActiveRecord::Migration
  def change
    create_table :custom_forms do |t|
      t.integer :section_id
      t.string :field_type
      t.string :text_en
      t.string :text_es
      t.string :text_fr
      t.string :text_pt
      t.boolean :required
      t.text :question_en
      t.text :question_es
      t.text :question_fr
      t.text :question_pt
      t.string :sort_index

      t.timestamps
    end
  end
end
