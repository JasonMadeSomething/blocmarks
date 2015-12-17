Rails.application.routes.draw do
  
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  devise_for :users
  root to: 'welcome#home'

end
