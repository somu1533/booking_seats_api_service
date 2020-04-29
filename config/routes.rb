Rails.application.routes.draw do
  #resources :seats, only: [:update]
  resources :venues, only: [:create, :show]
  patch '/venues/:id/seats/:seat_id' => 'seats#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
