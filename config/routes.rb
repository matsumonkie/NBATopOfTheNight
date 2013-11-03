NBATopOfTheNight::Application.routes.draw do

  root 'videos#index'

  resources :videos

end
