Rails.application.routes.draw do
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
