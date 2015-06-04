class User < ActiveRecord::Base
#  has_one :user_role

  validates :name,  presence: true,
                    length: {minimum: 3}
  validates :email, presence: true,
                    length: {minimum: 1},
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password,  presence: true,
                        length: {minimum: 5}
end
