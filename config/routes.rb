Rails.application.routes.draw do
	devise_for :users

	use_doorkeeper

	authenticate :user, -> (user) { user.has_role? User::ROLE_ADMIN } do
		mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	end

	resources :tests, only: %i{index} do
		collection do
			get :redirect_authorization_token
			post :redirect_access_token
		end
	end

	root to: 'rails_admin/main#dashboard'
end
