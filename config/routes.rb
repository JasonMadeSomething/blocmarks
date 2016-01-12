Rails.application.routes.draw do
  

  resources :topics, except: [:new, :edit, :update] do
    resources :bookmarks, only: [:destroy]
  end

  devise_for :users
  root to: 'welcome#home'

end
