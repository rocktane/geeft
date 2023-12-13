class ModificationColumnLien < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :liens, :lien
  end
end
