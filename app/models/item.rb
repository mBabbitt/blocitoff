class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('updated_at ASC') }

  validates :user, presence: true
  validates :name, length: {minimum: 2}, presence: true

def days_left
      6 - (DateTime.now.to_date - created_at.to_date).to_i
   end
end
