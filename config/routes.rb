Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :promotions
      resources :products do
        collection do
          get :search_products
        end
      end
      resources :departments
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end
