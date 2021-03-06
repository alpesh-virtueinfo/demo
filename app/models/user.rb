class User < ActiveRecord::Base
    
    SUPER_ADMIN = "SuperAdmin"
    CUSTOMER = "Customer"
    MANAGER = "Manager" 
    
    before_create { generate_token(:auth_token) }
    validates :first_name, presence: true, length: { minimum: 5 }
   # validates :password, presence: true
   # validates :password_confirmation, presence: true

    acts_as_authentic
    
    has_one :user_role, :dependent => :destroy
	has_one :role, :through => :user_role
    
    include SearchHandler
    
    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
end
