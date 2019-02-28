Rails.application.routes.draw do

  get 'courses' => 'courses#index'
  


  root 'pages#index'

  resources :courses do
    delete 'delete' => 'courses#destroy'
  end
  resources :cohorts do
    delete 'delete' => 'cohorts#destroy'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
