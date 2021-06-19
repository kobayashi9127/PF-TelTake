Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  devise_for :shops, controllers: {
    registrations: 'shops/registrations'
  }

  root to: 'shops#index'
  get 'about' => 'homes#about'
  resources :shops, only: [:index, :show, :edit, :update, :destroy]
  resources :foods, only: [:new, :create, :edit, :update, :destroy, :show]

  namespace :admins do
    resources :shops, only: [:index, :show, :destroy]
  end
end
