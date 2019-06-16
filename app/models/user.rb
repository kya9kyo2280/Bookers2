class User < ApplicationRecord

	validates :username,uniqueness: true

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def email_required?
           false
         end
 
         def email_changed?
           false
         end


    has_many :books, dependent: :destroy

    attachment :profile_image
end

