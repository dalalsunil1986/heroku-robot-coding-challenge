Rails.application.routes.draw do

  get '/', to: 'robots#index'
  get '/robots/search', to: 'robots#search'
  resources :robots
  resources :abilities, only: [:index, :show]

end
