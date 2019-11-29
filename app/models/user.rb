class User < ApplicationRecord
	# Others available devise modules are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

	ROLE_ADMIN = 'admin'.freeze
	ROLE_USER = 'user'.freeze
	ROLES = [ROLE_ADMIN, ROLE_USER]

	validates :email, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :employee_id, presence: true

	has_many :user_groups
	has_many :groups, through: :user_groups
	has_many :access_grants,
	         class_name: 'Doorkeeper::AccessGrant',
	         foreign_key: :resource_owner_id,
	         dependent: :destroy
	has_many :access_tokens,
	         class_name: 'Doorkeeper::AccessToken',
	         foreign_key: :resource_owner_id,
	         dependent: :destroy

	before_create :generate_uuid

	def name
		"#{first_name} #{last_name}"
	end

	def has_role? role
		self.role.eql? role
	end

	private

		def generate_uuid
			self.uuid = SecureRandom.uuid
		end
end
