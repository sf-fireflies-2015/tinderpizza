class Topping < ActiveRecord::Base

  belongs_to :pizza

  validates_presence_of :pizza

  validates :name, presence: true

  validates :calories, 
    :presence => true,
    :numericality => { :greater_than => 0}

end