class Project < ActiveRecord::Base
  has_many :tickets
  has_and_belongs_to_many :users

  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true, length:  {minimum: 0}
end
