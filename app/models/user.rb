class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  enum role: {user: 'user', admin: 'admin'}
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

            def initialize(params = {})
            super (params)

          end
end
