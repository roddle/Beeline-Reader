class ReadItem < ActiveRecord::Base
  belongs_to :beeline
  belongs_to :chart
end
