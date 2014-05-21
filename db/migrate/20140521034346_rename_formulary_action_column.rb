class RenameFormularyActionColumn < ActiveRecord::Migration
  def change
  	rename_column :formulary_actions, :inlfuence_description, :influence_description
  end
end
