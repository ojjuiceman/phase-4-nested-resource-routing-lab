Rails.application.routes.draw do
  resources :items, only: [:index]
  
  resources :users, only: [:show] do
    resources :items, only: [:index, :show, :create]
  end
end


# Rails.application.routes.draw do

#   resources :dog_houses, only: [:show] do
#     # nested resource for reviews
#     resources :reviews, only: [:show, :index]
#   end

#   resources :reviews, only: [:show, :index, :create]
# end