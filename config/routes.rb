Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'fridge_contents', to: 'fridges#show'
  # resources :fridges, only: [:show] do
  #   post 'add_item/:item_id', to: 'fridges#add_item', as: 'add_item'
  #   post 'delete_item/:item_id', to: 'fridges#delete_item', as: 'delete_item'
  # end

  resources :fridges do
    post 'increment_item', on: :collection  # if no specific fridge ID is required
    post 'delete_item', on: :collection
    post '/submit-form', to: 'forms#submit_form'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
