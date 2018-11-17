Rails.application.routes.draw do
  namespace :admin do
    resources :projects, only: [:index, :new, :create, :edit, :update] do
      post :complete
    end
  end

  resources :projects, only: [:index, :show] do
    member do
      post :comment
      get :claim
      get :unclaim
    end
  end

  get "sign_in", to: redirect("/auth/#{Rails.env.production? ? :google_oauth2 : :developer}")
  get "sign_out", to: "sessions#destroy"
  get "auth/failure", to: redirect("/")
  match "auth/:provider/callback", to: "sessions#create", via: %i[get post]

  root to: "home#index"
end
