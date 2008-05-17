require "lib/webrat"
require "lib/webrat/wang"

include Webrat

sess = WangSession.new
sess.visits "http://www.google.com/"
sess.fills_in "q", :with => "Webrat"
sess.clicks_button
sess.save_and_open_page
