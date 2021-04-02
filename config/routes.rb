Rails.application.routes.draw do

  root to: "items#index"
  devise_for :users
  resources :items do
    resources :archives, only:[:index,:create]
  end

end
