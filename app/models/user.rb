class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
#  добавил  :omniauthable, omniauth_prividers: [:facebook]

  # установим связь
  has_many :authorizations

  # валидация
  # validates :email    ,presence: true
  # validates :password ,presence: true
end
