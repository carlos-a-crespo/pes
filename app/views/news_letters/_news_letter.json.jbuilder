json.extract! news_letter, :id, :month, :year, :created_at, :updated_at
json.url news_letter_url(news_letter, format: :json)
