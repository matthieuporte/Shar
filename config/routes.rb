Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  #root 'home#index'
  get 'home/private'
  get 'pages/home'
  root 'pages#index'
  get 'publications' => 'pages#publications'
  get 'tchat' => 'pages#tchat'
  get 'messagerie' => 'pages#messagerie'
  get 'acceuil' => 'pages#acceuil'
  get 'newmessage' => 'pages#newmessage'
  post 'newmessage' => 'pages#postmessage'
  get 'message/:id' => 'pages#show'
  get 'top' => 'pages#top'
  get 'classement' => 'pages#top'
  patch 'account_edition' => 'pages#update'

  get 'publications' => 'pages#publications'
  post 'publications' => "pages#create"
  delete 'publications' => 'pages#destroy'

  get 'users/edit' => 'users/sessions#edit'
  put 'users/edit' => 'users/sessions#update'

  post 'users/:id' => 'pages#follow'

  get 'users/:id' => 'pages#profile'
  delete 'users/:id' => 'pages#destroyWithProfile'

  post 'users/:id' => 'pages#follow'
  patch 'users/:id' => 'pages#unfollow'
  patch 'users/:id' => 'pages#follow'

  post 'recherche' => 'pages#recherche'
  get 'recherche' => 'pages#recherche'
  get 'discover' => 'pages#discover'

  get 'sent' => 'pages#sent_messages'
  post 'tchat' => 'pages#newtchat'

  get "*path" => redirect("/404")
end
