Rails.application.routes.draw do
  resources :books

  get '/top' => 'root#top'
end
