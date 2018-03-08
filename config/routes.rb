Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'

  get  'static_pages/home'

  resources :event_types
  resources :events
  resources :news_letters do
    resources :articles
  end
end
