Rails.application.routes.draw do
	# resource :movies
  get 'movies' => 'movies#index'
  get 'movies/new' => 'movies#new', as: 'new_movie'
  get 'movies/:id' => 'movies#show', as: 'movie'
  post 'movies' => 'movies#create'
  delete 'movies/:id' => 'movies#destroy', as: 'destroy_movie'
  get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  patch 'movies/:id' => 'movies#update'
end
