NBATopOfTheNight::Application.routes.draw do

  root 'videos#index'

  get 'videos/show', to: 'videos#show'

end
