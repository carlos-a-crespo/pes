json.extract! article, :id, :title, :content, :news_letter_id, :created_at, :updated_at
json.url article_url(article, format: :json)
