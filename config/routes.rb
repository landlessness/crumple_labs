CrumpleAddons::Application.routes.draw do
  resources :markdowns

  resources :music_notation_thoughts

  root :to => 'pages#about'
end
