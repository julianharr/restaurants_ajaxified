Rails.application.routes.draw do
  resources :restaurants, only: [ :index, :show ] do
    # Only need somewhere to create the form then we can redirect somewhere else
    # Have to nest it so that we know what restaurant we're talking about
    resources :reviews, only: :create
  end
end
