class CreateNewsLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :news_letters do |t|
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
