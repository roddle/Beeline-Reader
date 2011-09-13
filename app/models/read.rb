class Read < ActiveRecord::Base
  validates :reading,   :presence =>  true
  validates :reading,   :length => { 
    :minimum => 20,
    :maximum => 100000,
    :too_short => "%{count} characters is the minimum allowed",
    :too_long => "%{count} characters is the maximum allowed" 
  }
  validates :total_reads, :numericality => { :only_integer => true }
  validates_uniqueness_of :name, :if => Proc.new {|read| !read.name.blank?}, :message => 'You can leave the name of this reading blank, but if you enter a name it must be unique.'

  has_many :beelines
end