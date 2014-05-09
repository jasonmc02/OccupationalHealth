OccupationalHealth::Application.routes.draw do

  devise_for :users
  resources :formularies
  resources :users, only: [:index]
  
  match "/" => "home#index", :via => :get

  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'home#index'
    resources :formularies
  end
end