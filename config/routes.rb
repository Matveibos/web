Rails.application.routes.draw do
  root 'pages#about', as: 'home'

  get 'about'=> 'posts#index',as:'about'
  resources  :posts
end
