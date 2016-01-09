Rails.application.routes.draw do
  
  resources :topics, except: [:new, :edit, :update] do
    resources :bookmarks, except: [:index]
  end
  post :incoming, to: 'incoming#create'
  devise_for :users
  root to: 'welcome#home'

end
