Rails.application.routes.draw do

  get 'welcome/index'

  resources :todos

   get "/todos", to: "todos#index"

  get '/delete/:id', to: 'todos#destroy'

  root 'welcome#index'
end
