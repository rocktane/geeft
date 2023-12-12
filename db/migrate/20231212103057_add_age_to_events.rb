class AddAgeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :age, :integer, null: false, default: 0
  end
end
