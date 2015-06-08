class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_role
  has_and_belongs_to_many :user_projects
  has_many :tickets

  validates :name,  presence: true,
                    length: {minimum: 3}
  validates :email, presence: true,
                    length: {minimum: 1},
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password,  presence: true,
                        length: {minimum: 5}

end
