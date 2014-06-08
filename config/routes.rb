OccupationalHealth::Application.routes.draw do

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

  devise_for :users
  resources :formularies
  resources :users, only: [:index, :update]

  match "/" => "home#index", :via => :get

  scope "/:locale", :locale => /en|es|fr|pt/ do
    root 'home#index'
    resources :formularies
  end
end