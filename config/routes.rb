Rails.application.routes.draw do
  devise_for :shops

  root to: 'homes#top'
  resources :shops, only: [:index, :show, :edit, :update, :destroy]
end
