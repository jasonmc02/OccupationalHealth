class CreateFormularyContacts < ActiveRecord::Migration
  def change
    create_table :formulary_contacts do |t|
      t.string :formulary_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :project_role

      t.timestamps
    end
  end
end
