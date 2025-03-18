Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "js", to: "home#js"
  get "js2", to: "home#js2"
  get "/member/:id", to: "member#show", as: 'member_show'
  get "/edit_description/:id", to: "member#edit_description", as: 'edit_descriptions'
  patch "/update_description/:id", to: "member#update_description", as: "update_description"
  resources :work_expriences
  resources :connections

end
