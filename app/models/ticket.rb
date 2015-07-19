class Ticket < ActiveRecord::Base
  belongs_to :client
  belongs_to :author, class_name: 'User'

  validates :subject, presence: true
  validates :details, presence: true, length: { minimum: 10 }
end
