Rails.application.routes.draw do
  devise_for :users
  root :to => 'pages#home'
  get '/pages/:page_name' => 'pages#index', :as => :pages
  get '/shifts/:id/select' => 'shifts#select', :as => :select_shift
end
