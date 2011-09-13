module ApplicationHelper
  def facebook_like
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?app_id=137736339651094&amp;href=http%3A%2F%2Fwww.facebook.com%2FBeeLine.Reader%3Fsk%3Dwall&amp;send=false&amp;layout=box_count&amp;width=54&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=90", :width => '54', :height => '90', :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
  end

  def twitter_tweet
    link_to "Tweet", "http://twitter.com/share"
    javascript_include_tag "http://platform.twitter.com/widgets.js"
  end  
end
