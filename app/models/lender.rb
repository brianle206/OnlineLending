class Lender < ActiveRecord::Base
  has_secure_password
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :first_name,:last_name, presence: true, length:{minimum: 2}
	validates :email, presence: true, uniqueness:{case_sensitive: false}, format:{with: EMAIL_REGEX}
	validates :password, presence: true, length:{minimum: 4},   :allow_blank => true, :on => :update
	before_save do 
		self.email.downcase!
		self.first_name.capitalize!
		self.last_name.capitalize!
	end
end
