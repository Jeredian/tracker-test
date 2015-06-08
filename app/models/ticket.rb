class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  delegate :name, to: :project

  enum state: {shelduled:0, in_work:1, closed:2, deffered:3 }

  state_machine :state, :initial => :shelduled do
    event :current do
      transition :shelduled => :in_work
    end
    event :done do
      transition [:in_work,:deffered] => :closed
    end
    event :paused do
      transition [:shelduled, :in_work] => :deffered
    end
  end

  validates :title, presence: true,length: {minimum: 0}
  validates :description, presence: true, length:  {minimum: 0}
end

