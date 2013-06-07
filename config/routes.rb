Servemore::Application.routes.draw do

  get 'needs/map'

  post "comments/:commentable_type/:commentable_id" => "comments#create", as: "create_comment", constraints: {commentable_type: /(need)/}
  delete "comments/:id" => "comments#destroy", as: "comment"

  resources :needs do
    resource :waiver
  end
  
  resources :resources, :as => "goods" do
    collection { resources :pods }
  end

  # Login
  match "oauth/callback" => "oauths#callback"
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  get "logout" => "oauths#logout"

  namespace :admin do
    resources :users
    resources :pods do
      collection { post :import }
    end
    resources :zones
    resources :wo_statuses
    resources :roles, :except => [:destroy]
    get '/' => 'dashboard#index', :as => 'dashboard'
  end

  namespace :my_account do
    resource "profile", :controller => "profile", :only => [:show, :edit, :update]
  end

  get 'geocode' => 'home#geocode'

  root :to => "home#index"

  end
