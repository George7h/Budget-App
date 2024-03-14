Rails.application.routes.draw do
  devise_for :users

  root 'splashpage#splash'

  # Home page (categories page)
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :expenses, only: [:new, :create, :edit, :update, :destroy]
  end

  # Transactions page
  resources :expenses, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  get 'add_new_category', to: 'groups#new'

  get 'add_new_transaction', to: 'expenses#new'
end
