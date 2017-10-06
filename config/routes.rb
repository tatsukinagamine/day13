Rails.application.routes.draw do
  resources :poems ,only: [:show, :update, :destroy, :edit, :new, :create, :index] do
    root 'poems#index'
  end
end
