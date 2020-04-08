class Book < ActiveRecord::Base
  belongs_to :user

  def self.check_status
      if self.status == nil?
        Checkout
      else
        Not Available
      end
  end
end
