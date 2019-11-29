User.where(email: 'admin@ims.com').first_or_create(
	first_name: 'IMS',
	last_name: 'Admin',
	employee_id: '0',
	role: User::ROLE_ADMIN,
	password: 'admin@123'
)