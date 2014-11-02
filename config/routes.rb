Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]
  # PAGE ROUTES
  get '/' => 'home#index', as: :root
  
  # USER ROUTES
  get 'users/' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  post 'users/' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # MAKE UP CASE ROUTES
  get 'makeupcases/' => 'makeupcases#index'
  get 'makeupcases/new' => 'makeupcases#new', as: :new_makeupcase
  get 'makeupcases/:id' => 'makeupcases#show', as: :makeupcase
  post 'makeupcases/' => 'makeupcases#create'
  get 'makeupcases/:id/edit' => 'makeupcases#edit', as: :edit_makeupcase
  patch 'makeupcases/:id' => 'makeupcases#update'
  delete 'makeupcases/:id' => 'makeupcases#destroy'

  # PRODUCT ROUTES
  get 'products/' => 'products#index'
  get 'products/new' => 'products#new', as: :new_product
  get 'products/:id' => 'products#show', as: :product
  post 'products/' => 'products#create'
  get 'products/:id/edit' => 'products#edit', as: :edit_product
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'
end

