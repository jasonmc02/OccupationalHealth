OccupationalHealth::Application.routes.draw do

  resources :form_wrappers, :except => [:show] do
    member do
      post :active
    end
    collection do
      post :deactive
    end
  end
  resources :sections, :except => [:index, :show] do
    member do
      get :sections
    end
  end

  resources :answers do
    member do
      delete :destroy_responses
    end
  end
  
  resources :custom_forms, :except => [:index, :show] do
    member do
      get :questions
    end
  end

  resources :user_file_shares do
    collection do
      get :fetch_user_file_shares
      post :upsert_user_file_shares
    end
    member do
      delete :stop_sharing
    end
  end

  resources :user_files do
    member do
      get :download
    end
  end

  resources :home do
    collection do
      get :custom_form
    end
  end

  devise_for :users
  resources :formularies
  resources :users, only: [:index, :update]

  match "/" => "home#index", :via => :get

  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'home#index'
    resources :formularies
    resources :user_files
    resources :user_file_shares
    resources :users
    resources :home
    resources :form_wrappers
    resources :sections
    resources :answers
    resources :custom_forms
  end
end