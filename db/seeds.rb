# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Read.delete_all
# . . .
Read.create(:name => 'Simple Article',
  :category => 'Easy Reading',
  :reading =>
    %{<p>
        It should be interesting to see what patterns of reading performance may
        be visible based on what people choose to read, and how familiar they are with
        the topic.
      </p>},
  :poster => 'Simple Todd',
  :created_at => DateTime.new(2011,4,6,17),
  :last_read => DateTime.new(2011,5,1,11),
  :word_count => "It should be interesting to see what patterns of reading performance may
  be visible based on what people choose to read, and how familiar they are with
  the topic.".scan(/[\w-]+/).size,
  :total_reads => 1)
# . . .