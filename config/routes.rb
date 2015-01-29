Rails.application.routes.draw do

  devise_for :users

  resources :estampas do
  	collection do
  		get 'search'
  	end
  	  resources :reviews, except: [:show, :index]
	end

  root 'estampas#index'

end
