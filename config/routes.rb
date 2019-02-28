Rails.application.routes.draw do
  root 'products#list_products'

  resources :products do
    collection do
      get 'list_products', to: "products#list_products"
    end
  end
end
