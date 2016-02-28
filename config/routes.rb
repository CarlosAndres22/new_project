Rails.application.routes.draw do
  devise_for :eventos

  resources :eventos, only: [:index, :show] do
  	resources :invitados
  end

  authenticated :evento do
  	root 'eventos#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end
