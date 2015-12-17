Rails.application.routes.draw do
  
  resources :topics, except: [:new] do
    resources :bookmarks, except: [:index]
  end

  devise_for :users
  root to: 'welcome#home'

end
