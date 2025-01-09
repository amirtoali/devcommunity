Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/member/:id", to: "member#show", as: 'member_show'
  get "/edit_descriptions/:id", to: "member#edit_description", as: 'edit_descriptions'
 patch "/update_descriptions/:id", to: "member#update_description", as: :update_description

end
