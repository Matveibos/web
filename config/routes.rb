Rails.application.routes.draw do


  resources :titles
  #на форуме советуют изменить devise_for devise_for :user, controller: { registration: "registration", omniauth_callbacks: "omniauth_callbacks" }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #users-таблица, говорим применить настройку контроллера ^
  # devise сгенерирова views в котором есть ссылки(выведутся на экран)
  #
  root 'posts#index', as: 'home'

  get 'about'=> 'pages#index_ac',as:'about'
  get 'privacy_policy'=> 'posts#privacy_policy'
  resources  :posts do
    resources :comments
  end
end
