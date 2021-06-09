Rails.application.routes.draw do
  devise_for :shops

  root to: 'homes#top'

end
