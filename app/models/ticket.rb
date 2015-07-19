class Ticket < ActiveRecord::Base
  belongs_to :client

  validates :subject, presence: true
  validates :details, presence: true, length: { minimum: 10 }
end
