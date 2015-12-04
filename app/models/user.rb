class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password

	has_many :questions

	validates :email,
		uniqueness: true,
		format: { :with => /\w+(.)*\w+@\w+(.)*\w+/}

	def self.authenticate(email, password)
		user = self.find_by(email: email)
		user.authenticate(password)			
	end
end
