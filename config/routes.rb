NBATopOfTheNight::Application.routes.draw do

  root 'videos#index'  
  
  get 'videos/show', to: 'videos#show', as: 'last_video'

end
