Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "graphiql", graphql_path: "graphql"
  end
  post "graphql", to: "graphql#execute"

  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create
  delete "signin", controller: :signin, action: :destroy

  namespace :api do
    namespace :v1 do
      resources :books
      resources :items
      resources :todo_lists
      resources :events
      resources :users
    end
  end

  root to: "home#index"
end
