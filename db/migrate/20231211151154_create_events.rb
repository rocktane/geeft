class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :list, array: true, default: []
      t.string :subject, array: true, default: []
      t.integer :budget_min, default: 5
      t.integer :budget_max, default: 4000
      t.string :genre, default: "neutral"
      t.string :occasion
      t.string :event_name
      t.date :event_date
      t.string :cagnotte_url
      t.string :event_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
