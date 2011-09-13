class Beeline < ActiveRecord::Base
  belongs_to :read
  
  has_many :read_items
  
  before_destroy :ensure_not_referenced_by_any_read_item
  
  #...
  
  private
    #ensure that there are no read items referencing this beeline
    def ensure_not_referenced_by_any_read_item
      if read_items.empty?
        return true
      else
        errors.add(:base, 'Read Items present')
        return false
      end
    end
end
