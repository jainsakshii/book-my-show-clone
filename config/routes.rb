Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  } 
  root to: "main#index"
  get 'home/index', to: "home#index"
  get '/show_bookings', to: "home#show_bookings"
  resources :theatres do
    resources :screens do
      resources :showtimes, only: [:show]
    end
  end
  
  resources :movies do
    member do
      get :show_seats
      post :book_tickets
    end
  end
  resources :checkout, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
