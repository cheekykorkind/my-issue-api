Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      scope module: :user do
        resources :auths, only: %i[destroy, update, detail], param: :code do
          member do
            get    :detail
            delete :destroy
            put    :update
          end
        end
        resources :auths, only: %i[index, create] do
          collection do
            get    :index
            post   :create
          end
        end
      end


    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end