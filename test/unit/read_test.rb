require 'test_helper'

class ReadTest < ActiveSupport::TestCase
  fixtures :reads

  test "submitted reading must have reading" do
    read = Read.new
    assert read.invalid?
    assert read.errors[:reading].any?
    assert read.errors[:total_reads].any?
  end
  
end
