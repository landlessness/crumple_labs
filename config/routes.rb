CrumpleAddons::Application.routes.draw do
  resources :music_notation_thoughts

  root :to => 'pages#about'
end
