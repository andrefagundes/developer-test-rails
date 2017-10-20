Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # config/routes.rb
  scope "(:locale)", locale: /en|pt/ do
    resources :paginas
    get "home/index"
    root to: "home#index"
  end



end
