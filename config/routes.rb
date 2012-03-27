Qiqi::Application.routes.draw do
  root :to => "home#index"

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/register" => "users#new"

  match "/session/create" => "sessions#create"

  match "/reply/new" => "replies#new"
  match "/reply/create" => "replies#create"
  match "/reply/:id" => "replies#reply", :as => :reply
  match "/reply/destroy/:id" => "replies#destroy", :as => :reply_destroy

  match "/topic/new" => "topics#new"
  match "/topic/create" => "topics#create"
  match "/topic/reply/:id" => "topics#reply", :as => :topic_reply
  match "/topic/destroy/:id" => "topics#destroy", :as => :topic_destroy

  match "/user/index" => "users#index"
  match "/user/create" => "users#create"
  match "/user/:username" => "users#single", :as => :user
  match "/user/destroy/:number" => "users#destroy", :as => :user_destroy
end
