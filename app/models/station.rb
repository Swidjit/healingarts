class Station < ActiveRecord::Base
  has_many :shifts
end