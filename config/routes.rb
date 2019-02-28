Rails.application.routes.draw do


  get 'courses' => 'courses#index'
  get 'cohorts' => 'cohorts#index'
  get 'instructors' => 'instructors#index'
  
  root 'pages#index'

  resources :courses do
    delete 'delete' => 'courses#destroy'
  end
  resources :cohorts do
    delete 'delete' => 'cohorts#destroy'
  end
  resources :instructors do
    delete 'delete' => 'instructors#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
