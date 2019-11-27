class Group < ApplicationRecord
	belongs_to :application, class_name: '::Doorkeeper::Application', optional: true
	has_many :user_groups
	has_many :users, through: :user_groups
end
