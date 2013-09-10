class Role < ActiveRecord::Base
  #SUPER_ADMIN = "SuperAdmin"

  has_many   :users     
  
  validates_presence_of :role_type
  validates_uniqueness_of :role_type
end
