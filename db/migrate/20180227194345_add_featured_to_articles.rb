class AddFeaturedToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :featured, :featured

    Article.all.each do |article|
      article.featured = false
      article.save!
    end

    change_column :articles, :featured, :featured, null: false
  end
end
