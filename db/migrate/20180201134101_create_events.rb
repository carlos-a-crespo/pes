class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, limit: 100, null: false
      t.string :description
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.references :event_type, foreign_key: true, null: false

      t.timestamps
    end
  end
end
