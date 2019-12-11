class TestsController < ActionController::Base
	def index
	end

	def redirect_authorization_token
		authorization_token = params['code']

		redirect_to controller: 'doorkeeper/tokens', action: 'create', params: {
			client_id: ENV['OAUTH_IMS_CLIENT_ID'],
			client_secret: ENV['OAUTH_IMS_CLIENT_SECRET'],
			code: authorization_token,
			grant_type: 'authorization_code',
			redirect_uri: ENV['OAUTH_IMS_AUTHORIZATION_REDIRECT_URI']
		}
	end

	def redirect_access_token

	end
end
