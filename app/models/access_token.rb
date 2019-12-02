class AccessToken < ApplicationRecord
	self.table_name = 'oauth_access_tokens'.freeze

	belongs_to :application
end
