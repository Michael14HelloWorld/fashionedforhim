class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #  :registerable, "Disabling any John Doe from creating an account."
         :recoverable, :trackable, :validatable
end
