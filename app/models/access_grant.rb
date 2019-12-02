class AccessGrant < ApplicationRecord
	self.table_name = 'oauth_access_grants'.freeze

	belongs_to :application
end
