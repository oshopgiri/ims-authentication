Rails.application.routes.draw do
	devise_for :users

	use_doorkeeper

	authenticate :user, -> (user) { user.has_role? User::ROLE_ADMIN } do
		mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	end

	root to: 'rails_admin/main#dashboard'
end
