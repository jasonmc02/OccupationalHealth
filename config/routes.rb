OccupationalHealth::Application.routes.draw do

  resources :formulary_contacts

  devise_for :users
  resources :formularies
  resources :users, only: [:index, :update]

  match "/" => "home#index", :via => :get

  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'home#index'
    resources :formularies
  end
end