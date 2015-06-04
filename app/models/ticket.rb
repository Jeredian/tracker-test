class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :title, presence: true,length: {minimum: 0}
  validates :description, presence: true, length:  {minimum: 0}
end
