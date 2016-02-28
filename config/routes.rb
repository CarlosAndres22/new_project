Rails.application.routes.draw do
 
  devise_for :eventos
  root 'welcome#index'

end
