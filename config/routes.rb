Rails.application.routes.draw do
  get 'tutors/new'
  get 'tutors/create'
  get 'tutors/edit'
  get 'tutors/update'
  get 'tutors/destroy'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/destroy'
  get '/courses', to: 'static_pages#courses'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  root 'static_pages#home'
  get '/tutor_signup',  to: 'tutors#new'
  get '/student_signup', to: 'students#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
