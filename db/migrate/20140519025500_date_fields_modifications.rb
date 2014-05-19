class DateFieldsModifications < ActiveRecord::Migration
  def change
    change_column :formulary_profiles, :period, :date
    rename_column :formulary_profiles, :period, :project_begins
    add_column :formulary_profiles, :project_ends, :date, :after => :project_begins
  end
end
