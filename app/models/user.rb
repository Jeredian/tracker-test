class User < ActiveRecord::Base
  belongs_to :user_role
  has_many :user_projects
  has_many :tickets

  validates :name,  presence: true,
                    length: {minimum: 3}
  validates :email, presence: true,
                    length: {minimum: 1},
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password,  presence: true,
                        length: {minimum: 5}
end
