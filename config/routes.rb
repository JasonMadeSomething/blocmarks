Rails.application.routes.draw do
  

  
  root to: 'welcome#home'
  resources :topics, except: [:new, :edit, :update] do
    resources :bookmarks, only: [:destroy]
  end
  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end
  post :incoming, to: 'incoming#create'
  devise_for :users
  resources :users, only: [:show]
  

end
