CrumpleAddons::Application.routes.draw do
  resources :music_notation_thoughts

  resources :pages, :only => [:show]
  root :to => "pages#about"
end
