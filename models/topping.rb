class Topping < ActiveRecord::Base

  belongs_to :pizza

  validates :name, presence: true

  validates :calories, 
    :presence => true,
    :numericality => { :greater_than => 0}

end