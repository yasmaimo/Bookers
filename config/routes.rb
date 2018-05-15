Rails.application.routes.draw do
  resources :books

  root to: 'root#top'
  get '/top' => 'root#top'
end
