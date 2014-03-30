OccupationalHealth::Application.routes.draw do
  
  resources :formulary_policies

  resources :formulary_actions

  resources :formulary_researches

  resources :formularies
  
  match "/" => "formularies#index", :via => :get
  
  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'formularies#index'
    resources :formularies
  end
end