class User < ApplicationRecord

	validates :name,uniqueness: true ,length: { minimum: 1, maximum: 20 }
    validates :introduction, length: { maximum: 50 }

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