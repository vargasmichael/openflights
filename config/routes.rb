Rails.application.routes.draw do
  root 'pages#index'
  #the root is ('/') route in flask. This will be handled by the index action in the pages controller 

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, param: :slug, only: [:show, :create, :destroy]
      #this is how to determine CRUD actions
    end
  end

  get '*path', to: 'pages#index', via: :all
  #route request that aren't for existing paths predefined in our api back to our index path
  #this will allow us to handle routing to our react component with out interfering with our rails routes for our API
end

