Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      devise_for :users, :controllers => {
        :sessions => 'users/sessions',
        :registrations => 'users/registrations',
      } 
      devise_scope :user do
        post "sign_up",   :to => "users/registrations#create"
        delete "sign_up", :to => "users/registrations#destroy"
        post "sign_in",   :to => "users/sessions#create"
        get "sign_out",   :to => "users/sessions#destroy" 
      end

      # scope module: :user do
      #   resources :auths, only: %i[destroy, update, detail], param: :code do
      #     member do
      #       get    :detail
      #       delete :destroy
      #       put    :update
      #     end
      #   end
      #   resources :auths, only: %i[index, create] do
      #     collection do
      #       get    :index
      #       post   :create
      #     end
      #   end
      # end


    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end