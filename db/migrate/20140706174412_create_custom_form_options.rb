class CreateCustomFormOptions < ActiveRecord::Migration
  def change
    create_table :custom_form_options do |t|
      t.integer :custom_form_id
      t.string :field_type
      t.string :description_en
      t.string :description_es
      t.string :description_fr
      t.string :description_pt
      t.string :misc_en
      t.string :misc_es
      t.string :misc_fr
      t.string :misc_pt

      t.timestamps
    end
  end
end
