class Pizza < ActiveRecord::Base
  validates :name, presence: true

  validates :price_cents, 
    :presence => true,
    :numericality => { :greater_than => 0}

  validates :diameter_inches, {
     :presence => true,
     :numericality => { 
       :greater_than => 0, 
       :less_than_or_equal_to => 36 
     }
  }

end