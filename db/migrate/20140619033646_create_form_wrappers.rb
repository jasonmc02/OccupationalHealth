class CreateFormWrappers < ActiveRecord::Migration
  def change
    create_table :form_wrappers do |t|
      t.string :title_en
      t.string :title_es
      t.string :title_fr
      t.string :title_pt
      t.string :description_en
      t.string :description_es
      t.string :description_fr
      t.string :description_pt
      t.boolean :active

      t.timestamps
    end
  end
end
