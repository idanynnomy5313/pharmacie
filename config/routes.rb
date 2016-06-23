Rails.application.routes.draw do

  
  get 'contacts/new'

  get 'contacts/create'

  resources :promotions
  resources :equipment
  resources :slides
  resources :workers
  
  get 'admin/connect'
  post 'admin/connect'
  get 'admin/logout'

  get 'attachment/show/:id', to: 'attachment#show', as: 'attachment_show'

  resources :equip_people

  get 'home', to: 'information#show', defaults:{name: 'home'}
  get 'charter', to: 'information#show', defaults:{name: 'charter'}
  get 'schedule', to: 'information#show', defaults:{name: 'schedule'}
  get 'map', to: 'information#show', defaults:{name: 'map'}

  get 'home/edit', to: 'information#edit', defaults:{name: 'home'}
  get 'charter/edit', to: 'information#edit', defaults:{name: 'charter'}
  get 'schedule/edit', to: 'information#edit', defaults:{name: 'schedule'}
  get 'map/edit', to: 'information#edit', defaults:{name: 'map'}

  patch 'information/:id', to: 'information#update', as: 'information'


  match '/contacts', to: 'contacts#new', via: 'get'
  resources 'contacts', only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
