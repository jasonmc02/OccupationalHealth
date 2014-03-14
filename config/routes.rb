OccupationalHealth::Application.routes.draw do

  resources :formulary_profile_classifies

  resources :formulary_profile_reaches

  resources :formulary_profile_areas

  resources :formulary_profiles

  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'home#index'
  end

  match "/" => "home#index", :via => :get

end