class Shift < ActiveRecord::Base
  belongs_to :station
  has_and_belongs_to_many :users
end