Rails.application.routes.draw do
  get    '/student_login',   to: 'sessions#new_student'
  post   '/student_login',   to: 'sessions#create_student'
  delete '/logout',  to: 'sessions#destroy'
  get    '/tutor_login',   to: 'sessions#new_tutor'
  post   '/tutor_login',   to: 'sessions#create_tutor'
  get 'courses/index'
  get 'courses/new'
  get 'courses/edit'
  get 'courses/show'
  get '/courses', to: 'static_pages#courses'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  root 'static_pages#home'
  get '/tutor_signup',  to: 'tutors#new'
  post '/tutor_signup', to: 'tutors#create'
  get '/student_signup', to: 'students#new'
  post '/student_signup', to: 'students#create'
  resources :tutors
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
