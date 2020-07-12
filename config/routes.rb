Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "graphiql", graphql_path: "graphql"
  end
  post "graphql", to: "graphql#execute"

  devise_for :users, path: 'auth'
  as :user do
    post 'auth/sign_in' => 'auth/sessions#create', defaults: { format: :json }
    delete 'auth/sign_out' => 'auth/sessions#destroy', defaults: { format: :json }

    post 'auth' => 'auth/registrations#create', defaults: { format: :json }

    post 'auth/password' => 'devise/passwords#create', defaults: { format: :json }
    match 'auth/password' => 'devise/passwords#update', via: %i[put patch], defaults: { format: :json }

    get 'auth/unlock' => 'devise/unlocks#show', defaults: { format: :json }
    post 'auth/unlock' => 'devise/unlocks#create', defaults: { format: :json }

    post 'auth/confirmation' => 'devise/confirmations#create', defaults: { format: :json }
    get 'auth/confirmation' => 'devise/confirmations#show', defaults: { format: :json }
  end





  #post "refresh", controller: :refresh, action: :create
  #post "signin", controller: :signin, action: :create
  #post "signup", controller: :signup, action: :create
  #delete "signin", controller: :signin, action: :destroy

  namespace :api do
    namespace :v1 do
      resources :books
      resources :items
      resources :todo_lists
      resources :events
      resources :users
    end
  end

  root 'home#index'
end
