Qiqi::Application.routes.draw do
  root :to => "home#index"

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/register" => "users#new"

  namespace :session do
    match "/session/create" => "sessions#create"
  end

  namespace :reply do
    match "/new" => "replies#new"
    match "/create" => "replies#create"
    match "/reply/:id" => "replies#reply"
    match "/destroy/:id" => "replies#destroy"
  end

  namespace :topic do
    match "/new" => "topics#new"
    match "/create" => "topics#create"
    match "/reply/:id" => "topics#reply"
    match "/destroy/:id" => "topics#destroy"
  end

  namespace :user do
    match "/index" => "users#index"
    match "/create" => "users#create"
<<<<<<< HEAD

    match "/:username" => "users#single"
=======
>>>>>>> a7b7f2d06edb2e5708607ecada84a371ac29506f
    match "/destroy/:number" => "users#destroy"
  end
end
