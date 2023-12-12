class AddliensToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :liens, :string, null: false
  end
end
