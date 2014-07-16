class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :form_wrapper_id
      t.string :title_en
      t.string :title_es
      t.string :title_fr
      t.string :title_pt
      t.string :description_en
      t.string :description_es
      t.string :description_fr
      t.string :description_pt
      t.string :sort_index

      t.timestamps
    end
  end
end
