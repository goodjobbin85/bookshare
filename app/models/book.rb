class Book < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :author, :year_published, :condition

  def self.check_status
      if self.status == nil?
        Checkout
      else
        Not Available
      end
  end
end
