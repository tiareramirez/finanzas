Rails.application.routes.draw do
  
  # get '/' , to: 'home#home'
  # get '/home' , to: 'home#home'
  # # get '/home' , to: 'home#home', as: :home_path

  

  namespace :authentication, path: '' , as: '' do
    resources :users, only: [:new,:create]
    resources :sessions, only: [:new,:create]
    get '/sessions/destroy' , to: 'sessions#destroy'
  end

  namespace :finanzas, path: '' , as: '' do
    resources :categorias, only: [:index,:new,:create,:update,:edit]
    resources :ingresos, only: [:index,:new,:create,:update,:edit,:show]
    resources :egresos, only: [:index,:new,:create,:update,:edit,:show]

    get '/categorias' , to: 'categorias#index'
    get '/ingresos/destroy/:id' , to: 'ingresos#destroy' 
    get '/egresos/destroy/:id' , to: 'egresos#destroy' 
    # get '/categorias/:id' , to: 'categorias#update' as: :update_categorias
  end
  namespace :inicio, path: '' , as: '' do
    resources :home, path: '/'
  end
end
 