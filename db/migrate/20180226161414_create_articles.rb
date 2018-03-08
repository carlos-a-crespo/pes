class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.references :news_letter, foreign_key: true

      t.timestamps
    end
  end
end
