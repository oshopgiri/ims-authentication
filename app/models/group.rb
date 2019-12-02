class Group < ApplicationRecord
	belongs_to :application, class_name: 'Application'
	has_many :user_groups
	has_many :users, through: :user_groups

	validates :name, presence: true
	validates :description, presence: true
	validates :meta_info, presence: true
end
