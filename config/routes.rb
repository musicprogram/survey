Rails.application.routes.draw do
  resources :cuestionarios
  resources :h_preguntas
  resources :preguntas
  resources :usuarios

  devise_for :users, controllers: { registrations: :registrations }

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
