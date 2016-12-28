Rails.application.routes.draw do
  resources :artists
  resources :genres
  resources :songs
  get 'song_provider/:info' => 'song_provider#index'

  root to: 'songs#index'
end
