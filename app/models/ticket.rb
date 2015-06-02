class Ticket < ActiveRecord::Base
  validates :title, presence: true,length: {minimum: 0}
  validates :description, presence: true, length:  {minimum: 0}
end
