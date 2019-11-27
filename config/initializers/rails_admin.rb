RailsAdmin.config do |config|

	### Popular gems integration

	## == Devise ==
	# config.authenticate_with do
	#   warden.authenticate! scope: :user
	# end
	# config.current_user_method(&:current_user)

	## == CancanCan ==
	# config.authorize_with :cancancan

	## == Pundit ==
	# config.authorize_with :pundit

	## == PaperTrail ==
	# config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

	### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

	## == Gravatar integration ==
	## To disable Gravatar integration in Navigation Bar set to false
	# config.show_gravatar = true

	config.actions do
		dashboard # mandatory
		index # mandatory
		new
		export
		bulk_delete
		show
		edit
		delete
		show_in_app

		## With an audit adapter, you can add:
		# history_index
		# history_show
	end

	config.model 'Group' do
		include_fields :name, :description, :meta_info, :users

		list do
			exclude_fields :users
		end
	end

	config.model 'User' do
		include_fields :email, :first_name, :last_name

		field :employee_id do
			label 'Employee ID'
		end

		include_fields :groups, :uuid

		edit do
			include_fields :password, :password_confirmation
			exclude_fields :uuid
		end

		show do
			include_fields :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
		end
	end

	config.model 'UserGroup' do
		visible false
	end
end
