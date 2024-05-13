Rails.application.routes.draw do
  root :to => 'home#index'
  get '/products', :to => 'products#index'
  mount ShopifyApp::Engine, at: '/'
# frozen_string_literal: true

namespace :app_proxy do
  root action: "index"
  # simple routes without a specified controller will go to AppProxyController

  # more complex routes will go to controllers in the AppProxy namespace
  #   resources :reviews
  # GET /app_proxy/reviews will now be routed to
  # AppProxy::ReviewsController#index, for example
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
