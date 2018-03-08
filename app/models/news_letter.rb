class NewsLetter < ApplicationRecord
  has_many :articles, -> { order featured: :desc, id: :asc }
end
