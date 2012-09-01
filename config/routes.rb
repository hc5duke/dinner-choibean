Dinner::Application.routes.draw do
  resources :meals

  root :to => 'meals#index'
end
