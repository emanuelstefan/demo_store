Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    collection do
      get 'list_products', to: "products#list_products"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
