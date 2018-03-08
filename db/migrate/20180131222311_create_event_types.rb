class CreateEventTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :event_types do |t|
      t.string :name, limit: 50, null: false
      t.string :color, limit: 7, null: false

      t.timestamps
    end
    add_index :event_types, :name, unique: true
  end
end
