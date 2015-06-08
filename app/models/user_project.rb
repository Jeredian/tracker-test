class UserProject < ActiveRecord::Base
  has_and_belongs_to_many :project
  has_and_belongs_to_many :user
end
